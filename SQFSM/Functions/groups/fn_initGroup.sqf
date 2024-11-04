params [
	["_group", nil, [grpNull]],
	["_wait",  false, [false]]
];
if(_wait
&&{canSuspend})
then{sleep 1};

if!(side _group in SQFM_validSides) exitWith{};
if(isNull _group)                   exitWith{};

if(time > 10)then{[["Initializing group ",_group," ",count units _group]]call dbgm};

[_group] call SQFM_fnc_setGroupOwner;
[_group] call SQFM_fnc_initGroupData;
[_group] call SQFM_fnc_grpEvents;
[_group] call SQFM_fnc_initSquadMembers;

true;