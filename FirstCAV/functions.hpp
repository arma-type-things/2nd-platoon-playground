class FirstCAV {
    class paradrop {
        file = "FirstCAV\systems\paradrop";
        class paradrop {}; // "FirstCAV_fnc_paradrop"
        class action_paradrop {};  // "FirstCAV_fnc_action_paradrop"
    };

    class earplugs {
        file = "FirstCAV\systems\earplugs";
        class earplugs {}; // "FirstCAV_fnc_earplugs"
    };

    class core_init {
        file =	"FirstCAV\systems\core\init";
        class pre_init
        {
            preinit = 1;
        };
        class post_init
        {
            postinit = 1;
        };
    };

    class teams {
        file = "FirstCAV\systems\core\teams";
        class change_team {}; // "FirstCAV_fnc_change_team"
    }
};