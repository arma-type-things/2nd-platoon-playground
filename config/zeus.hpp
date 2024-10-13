class FirstCAV_zeusmode
{
	class paradrop {
		#include "..\FirstCAV\configs\paradrop.hpp"
	};
	
	class playerVars {
		public[] = {"firstcav_db_player_group","firstcav_db_friends"};
		hidden[] = {};
	};

	// firstcav_respawn_armatypethings
	class teams {
		class ArmaTypeThings
		{
			name = "Arma Type Things [ATT]";
			// TODO: use ATT Logo
			icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_MikeForce_HL.paa";
			shortname = "ATT";
			//Function Calls on team Join
			onJoin = "";
			onLeave = "";
		};
	};
};

#include "\a3\ui_f\hpp\definedikcodes.inc"

// so we don't get errors when updating the local vars / when loading paradigm parameters
class gamemode {
	class tracking {};
	class keys {
		class para_keydown_open_wheel_menu {
			defaultKey = DIK_6;
			shift = "false";
			ctrl = "false";
			alt = "false";
			function = "para_c_fnc_wheel_menu_open_keybind";
			down = 1;
			displayName = $STR_vn_mf_keybindings_selector;
			access = 1;
		};
		class para_vote_1 {
			defaultKey = DIK_F1;
			shift = "false";
			ctrl = "false";
			alt = "false";
			function = "para_c_fnc_vote_1";
			down = 1;
			displayName = "Vote for Option #1";
			access = 1;
		};
		class para_vote_2 {
			defaultKey = DIK_F2;
			shift = "false";
			ctrl = "false";
			alt = "false";
			function = "para_c_fnc_vote_2";
			down = 1;
			displayName = "Vote for Option #2";
			access = 1;
		};
		class para_vote_3 {
			defaultKey = DIK_F3;
			shift = "false";
			ctrl = "false";
			alt = "false";
			function = "para_c_fnc_openVoteMenu";
			down = 1;
			displayName = "Open Voting Menu";
			access = 1;
		};
		class firstcav_interactionOverlay_toggle {
			defaultKey = DIK_7; // 7
			shift = "false";
			ctrl = "false";
			alt = "false";
			function = "para_c_fnc_interactionOverlay_toggle";
			down = 1;
			displayName = $STR_vn_mf_keybindings_interactionOverlay_toggle;
			access = 1;
		};
	};

	class interaction_overlay {
		/*
			class CLASSNAME
			{
				name = "";
				icon = "";
				description = "";
				variables[] = {}; // String array of code
			};
		*/

		class Settings
		{
			distance = 6;
			liveText = 1;
			defaultKey = 7;
		};

		class DutyOfficer
		{
			name = "Duty Officer";
			icon = "";
			description = "Change teams or train in a role, such as engineer.";
			variables[] = {};
		};

		class FastTravel
		{
			name = "Fast Travel";
			icon = "";
			description = "Teleport to the bases of each team";
			variables[] = {};
		};

		class SupplyOfficer
		{
			name = "Supply Officer";
			icon = "";
			description = "Request supplies, such as building supplies, food or ammunition.";
			variables[] = {};
		};

		class Land_vn_b_prop_mapstand_01
		{
			name = "Map on a piece of wood";
			icon = "";
			description = "Health: <t color='#FF0000'>%2%1</t><br/>Distance: %3m";
			variables[] = { "'%'", "round (100 - (damage _object) * 100)", "round (_object distance player)" };
		};
	};
};