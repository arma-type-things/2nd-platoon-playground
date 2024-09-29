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

private _initialised = _player getVariable "para_s_player_initialised";
// prevent repeated execution of init
if !(isNil "_initialised") exitWith {};

private _uid = getPlayerUID _player;
(["GET", (_uid + "_data"), []] call para_s_fnc_profile_db) params ["","_object_data"];

_player setVariable ["para_s_player_initialised", true];
