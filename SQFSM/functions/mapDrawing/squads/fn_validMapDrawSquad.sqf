params[
    ["_group",nil,[grpNull]]
];
private _data = _group call getData;
if(isNil "_data")exitWith{false};

private _members = _data call ["getGrpMembers"];
if(count _members < 1)exitWith{false};

private _valid = _self call ["isValid"];
if!(_valid)exitWith{false};

private _friendly = !([player, _group] call SQFM_fnc_hostile);
if(_friendly)exitWith{true};

private _showHostile = SQFM_showHostileSquadMapMarkers;
if(_showHostile isEqualTo "always") exitWith{true};
if(_showHostile isEqualTo "never")  exitWith{false};

private _minKnowledge = 3.2;
private _ownGrp       = group player;
if(_showHostile isEqualTo "known_group"
&&{[_ownGrp, _group] call SQFM_fnc_knowsAboutGroup > _minKnowledge})
exitWith{true};

private _side = side _ownGrp;
if(_showHostile isEqualTo "known_side"
&&{[_side, _group] call SQFM_fnc_knowsAboutGroup > _minKnowledge})
exitWith{true};

false;