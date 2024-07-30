params [ 
    ["_man",      nil, [objNull]],  // The man that will garrison.
    ["_building", nil, [objNull]], //  House
    ["_pos",      nil,      [[]]] //   House position (ATL)
];
private _high      = (_pos#2)>2;
private _dist      = _man distance _pos;
private _time      = _dist+30;
private _onArrival = [[_man, _building, _pos], SQFM_fnc_onManGarrison];

if(_high)then{_time=_time+15};

if(!isNil "SFSM_fnc_flashAction")
then{[_man, "Moving to garrison"] spawn SFSM_fnc_flashAction};


_man setVariable ["SFSM_Excluded",true,true];

[
    _man, 
    _pos, 
    _time, 
    3,
    _onArrival
] call SQFM_fnc_fsmMoveManToPos;

if(!isNil "SFSM_fnc_flashAction")
then{[_man, "Garrison-move ended"] spawn SFSM_fnc_flashAction};
// if(_man distance _pos > 3)
// then{[_man, _pos, true] call SQFM_fnc_manForceMoveToPos};

_man setVariable ["SFSM_Excluded",false,true];

true;