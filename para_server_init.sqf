// start scheduler
diag_log "1st Cav: Starting scheduler";
[] call para_g_fnc_scheduler_subsystem_init;

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