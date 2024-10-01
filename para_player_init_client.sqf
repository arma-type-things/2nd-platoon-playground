/*
	File: para_player_init_client.sqf
	Author: Savage Game Design
	Public: Yes

	Description:
		Called on the client after player_init_server has finished.
		Serverside player initialisation is done at this point.
		It is safe to access the player object in this function.
		Used for setting up UI elements, local event handlers, etc.

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

params ["_player", "_didJIP"];

// Instantiate the main scheduler
[] call para_g_fnc_scheduler_subsystem_init;

call para_g_fnc_event_subsystem_init;

//Setup teleporters
// call vn_mf_fnc_action_teleport;

//Setup paradrop
call FirstCAV_fnc_action_paradrop;

setplayerrespawntime 10;

// Initalize marker info UI
[] call para_c_fnc_zone_marker_init;

// Start AI processing for local player, if we're not a LAN server (as then serverside processing will kick in)
if (!isServer) then {
	call para_g_fnc_ai_create_behaviour_execution_loop;
};

// initialize tools controller
call para_c_fnc_tool_controller_init;

//LOADING COMPLETE
//Start tidying up ready for play.
// Restore the music volume in the near future.
[] spawn {sleep 8; playMusic ""; 2 fadeMusic 1};
// Re-enable simulation
if (typeOf player != "VirtualCurator_F") then {
	player enableSimulation true;
};

//enabling and setting stamina
player enableStamina false;

[] spawn
{
	while {true} do
	{
		uiSleep 0.5;
		[] call para_c_fnc_set_aperture_based_on_light_level;
	};
};

//DEV (ToDo): Until client Scheduler is added:
[]spawn
{
	systemchat "starting infopanel handler loop";
	"para_infopanel" cutRsc ["para_infopanel", "PLAIN", -1, true];
	while{true}do
	{
		uisleep 0.5;
		[] call para_c_fnc_infopanel_handler;
	};
};

["InitializePlayer", [player]] call para_c_fnc_dynamicGroups;