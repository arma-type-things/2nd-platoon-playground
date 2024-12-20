/*
    File: fn_earplugs.sqf
    Author: Savage Game Design
    Public: No

    Description:
	    Enables/disables earplugs.

    Parameter(s):
        _status - Description [BOOL]

    Returns: nothing

    Example(s):
	    ["",true] call FirstCAV_zeusmode_fnc_earplugs;
*/

params
[
	"_status" 		// 0 : BOOLEAN - status of earplugs
];

localNamespace setVariable ["vn_mf_earplugs",_status];
systemChat localize (["Earplugs Out","Earplugs In"] select _status);
0.5 fadeSound ([1,0.2] select _status);
