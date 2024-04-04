params [
	["_man", nil, [objNull]]
];

if(lifeState _man == "INCAPACITATED")                   exitWith{true;}; // Default Arma III
if(_man getVariable ["ACE_isUnconscious", false])       exitWith{true;}; // ACE 3
if(_man getVariable ["dam_ignore_injured0", false])     exitWith{true;}; // Personal Injury Reaction (PIR)
if(_man getVariable ["vn_revive_incapacitated", false]) exitWith{true;}; // SOG DLC

false;