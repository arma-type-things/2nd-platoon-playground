class wheel_menu_actions 
{
	class base_action 
	{
		//In what situations should the action be visible.
		//ALWAYS is always shown.
		//NO_TARGET is shown when the player isn't looking at an object.
		//Anything else means the action needs to be explicitly shown by the code, such as added to an object.
		visible = "";
		//Action is only visible when condition returns "true"
		condition = "true";
		//Text to display
		text = "";
		//Path to the icon to be shown
		icon = "";
		//Path to the icon to be shown when the entry is highlighted.
		icon_highlighted = "";
		//Arguments to pass to the function, compiled to code.
		arguments = "";
		//Function to call. Looked up in mission namespace.
		function = "";
		//Whether to spawn the function, or call it. 0 for call, 1 for spawn.
		spawn = 0;
		//Colors for the wheel menu
		color_codes[] = {{0.2,0.2,0.2,0.8}, {0.8,0.8,0.8,1}};
		//Colors for the icon
		icon_color_codes[] = {{0.6,0.6,0.6,0.8}, {1,1,1,0.95}};

	};

	// MARK: - Earplugs
	// Uses SGD's earplugs function (with credit in SQF)
	// Put in earplugs
	class earplugs_in : base_action
	{
		visible = "ALWAYS";
		condition = "!(localNamespace getVariable ['vn_mf_earplugs', false])";
		text = "Earplugs In";
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_ear_in_ca.paa";
		icon_highlighted = "";
		arguments = "true";
		function = "FirstCAV_fnc_earplugs";
		spawn = 0;
	};

	// Remove earplugs
	class earplugs_out : base_action
	{
		visible = "ALWAYS";
		condition = "(localNamespace getVariable ['vn_mf_earplugs', false])";
		text = "Earplugs Out";
		icon = "\vn\ui_f_vietnam\ui\wheelmenu\img\icons\vn_ico_mf_ear_out_ca.paa";
		icon_highlighted = "";
		arguments = "false";
		function = "FirstCAV_fnc_earplugs";
		spawn = 0;
	};
};
