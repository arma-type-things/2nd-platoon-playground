/*
    File: para_server_init.sqf
    Public: Yes

    Description:
        Called to initialise the server on game start.

    Parameter(s):
        None

    Returns:
        None

    Example(s):
        //In description.ext
        use_paradigm_init = 1;
*/

private _gamemode_config = (missionConfigFile >> "FirstCAV_zeusmode");

diag_log "1st Cav: Finding spawn markers";
respawn_markers = [];
{
    if (_x find "firstcav_respawn_" isEqualTo 0) then {
		respawn_markers pushBack _x;
	};
} forEach allMapMarkers;


diag_log "1st Cav: Setting up spawn points";
firstcav_respawn_points = respawn_markers apply {
	[west, _x, markerText _x] call BIS_fnc_addRespawnPosition
};

// start scheduler
diag_log "1st Cav: Starting scheduler";
[] call para_g_fnc_scheduler_subsystem_init;
call para_g_fnc_event_subsystem_init;


//Set up slingloaded item locality on helicopters.
["vehicleCreated", [
    {
        params ["_args", "_vehicle"];
        //Call it on every vehicle - it'll abort if it's not a helicopter.
        [_vehicle] call para_g_fnc_localize_slingloaded_objects;
    },
    []
]] call para_g_fnc_event_add_handler;

diag_log "1st Cav: Initialising Dynamic Groups";
["Initialize"] call para_c_fnc_dynamicGroups;