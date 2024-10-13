params ["_player", "_team"];

private _playerGroup = _player getVariable ["firstcav_db_player_group", "FAILED"];

if (_playerGroup isEqualTo _team) exitWith {}; // don't do anything and exit out

private _playerGroupArray = missionNamespace getVariable [_playerGroup,[]];
["changedTeams", [_player, _team]] call para_g_fnc_event_dispatch;

// Remove the player from their original team's group array
_playerGroupArray deleteAt (_playerGroupArray find _player);
publicVariable _playerGroup;

// Add the player to the new team's player list.
_player setVariable ["firstcav_db_player_group", _team, true];
private _nextPlayerTeamArray = missionNamespace getVariable [_team, []];
_nextPlayerTeamArray pushBackUnique _player;
publicVariable _team;