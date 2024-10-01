/*
    File: para_player_init_server.sqf
    Author: Savage Game Design
    Public: Yes

    Description:
		Called on the server immediately after preinit_client, and before init_client.
		Perform server-side player initialisation here.
		It is safe to access the player object in this function.

		Load order:
			- para_player_preload_client.sqf - Called as soon as possible on the client.
			- para_player_loaded_client.sqf - Called on client as soon as the player is ready
			- para_player_init_server.sqf - Serverside player initialisation.
			- para_player_init_client.sqf - Clientside player initialisation.
			- para_player_postinit_server.sqf - Called on server once all player initialisation is done.

    Parameter(s):
		_player - Player to initialise [OBJECT]
		_didJIP - Whether the player joined in progress [BOOLEAN]

    Returns:
		None

    Example(s):
		//description.ext
		use_paradigm_init = 1;
*/

params [["_player", objNull, [objNull]], ["_didJIP", true, [true]]];

diag_log format ["1st Cav: Player init server for %1", name _player];

private _initialised = _player getVariable "para_s_player_initialised";
// prevent repeated execution of init
if !(isNil "_initialised") exitWith {};

private _uid = getPlayerUID _player;
(["GET", (_uid + "_data"), []] call para_s_fnc_profile_db) params ["","_object_data"];

private _config = (missionConfigFile >> "gamemode" >> "playerVars");
private _public_vars = getArray(_config >> "public");
private _blacklisted_vars = getArray(_config >> "hidden");

_local_vars = [];
if !(_object_data isEqualTo []) then
{
	{
		_x params ["_varname","_vardata"];
		if (!isNil "_vardata" && !(_varname in _blacklisted_vars)) then
		{
			if (_varname in _public_vars) then
			{
				// set everwhere
				_player setVariable [_varname,_vardata,true];
			}
			else
			{
				// set only on server and client
				_local_vars pushBack [_varname,_vardata];
				_player setVariable [_varname,_vardata];
			};
		};
	} forEach _object_data;
};

// set new enlisted number
private _enlisted = _player getVariable ["firstcav_db_serial","0"];
if (_enlisted isEqualTo "0") then {
	private _warcodes = [51,52,53,54,55,56];
	// increment enlisted count server side
	firstcav_enlisted_counter = firstcav_enlisted_counter + 1;
	["SET", "enlisted_counter", firstcav_enlisted_counter] call para_s_fnc_profile_db;
	private _serial = format["US %1 %2",selectRandom _warcodes,firstcav_enlisted_counter];
	_local_vars pushBack ["firstcav_db_serial",_serial];
	_player setVariable ["firstcav_db_serial",_serial];
};

// last group, or if not one assign ATT
private _lastTeamName = _player getVariable ["firstcav_db_player_group", "ArmaTypeThings"];
// Attempt team change, defaulting to ATT if team is full.
[_player, _lastTeamName] call FirstCAV_fnc_change_team;

// load last loadout
(["GET", (_uid + "_loadout"), []] call para_s_fnc_profile_db) params ["","_loadout"];
if !(_loadout isEqualTo []) then
{
	_player setUnitLoadout [_loadout, false];
};

// Spawn
private _respawnMarker = format ["mf_respawn_%1", _lastTeamName];
_player setPos getMarkerPos _respawnMarker;

// firstcav_respawn_armatypethings

// send all variables to player
[_local_vars] remoteExecCall ["para_c_fnc_set_local_var", _player];

_player setVariable ["para_s_player_initialised", true];
