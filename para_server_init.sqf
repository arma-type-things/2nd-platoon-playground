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

diag_log "1st Cav: Starting event subsystem";
call para_g_fnc_event_subsystem_init;

// Cleanup system
// start cleanup subsystem
[
    createHashmapFromArray [
        ["minPlayerDistance", 400],
        ["maxBodies", 50],
        ["cleanPlacedGear", false],
        ["placedGearCleanupTime", 300],
        ["cleanDroppedGear", true],
        ["droppedGearCleanupTime", 300]
    ]
] call para_s_fnc_cleanup_subsystem_init;

// MARK: - SaveData load
diag_log "1st Cav: Loading player data";
(["GET", "enlisted_counter", 745001] call para_s_fnc_profile_db) params ["",["_enlisted_counter",0]];
firstcav_enlisted_counter = _enlisted_counter;
["GET", "chopped_trees", ""] call para_s_fnc_profile_db params ["","_chopped_trees"];
if !(_chopped_trees isEqualType "") then {
    {[_x] call para_s_fnc_fell_tree_initial;} forEach (_chopped_trees # 0);
};

//Set up slingloaded item locality on helicopters.
["vehicleCreated", [
    {
        params ["_args", "_vehicle"];
        //Call it on every vehicle - it'll abort if it's not a helicopter.
        [_vehicle] call para_g_fnc_localize_slingloaded_objects;
    },
    []
]] call para_g_fnc_event_add_handler;

// TODO: Probably remove this ?
dawnLength = ["dawn_length", 1200] call BIS_fnc_getParamValue;
dayLength = ["day_length", 7200] call BIS_fnc_getParamValue;
duskLength = ["dusk_length", 1200] call BIS_fnc_getParamValue;
nightLength = ["night_length", 1200] call BIS_fnc_getParamValue;
[dawnLength, dayLength, duskLength, nightLength] call para_s_fnc_day_night_subsystem_init;

diag_log "1st Cav: Initialising Dynamic Groups";
["Initialize"] call para_c_fnc_dynamicGroups;