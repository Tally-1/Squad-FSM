params[
    ["_group", nil,[grpNull]],
    ["_rad",   50,       [0]],
    ["_wait",  false, [true]]
];
private _leader    = leader _group;
private _data      = _group call getData;
private _pos       = getPosATLVisual _leader;
private _buildings = [_pos, _rad] call SQFM_fnc_nearBuildings;
private _bldPosArr = [_buildings, _pos] call SQFM_fnc_allBuildingsPositions;
private _men       = _data call ["getUnitsOnfoot"];
private _endIndex  = count _men -1;
private _scripts   = [];


{
    if(_foreachIndex >= _endIndex)exitWith{};

    private _targetPos = _x;
    private _man       = _men#_foreachIndex;
    private _time      = round(_man distance _targetPos)+15;
    private _onMoveEnd = [_man, {_this setVariable ["SFSM_Excluded",false,true]}];
    private _condition = [_man, {currentCommand _this isEqualTo "SCRIPTED"}];

    _man setVariable ["SFSM_Excluded",true,true];
    _scripts pushBackUnique 
    ([_man, _targetPos, _time,3,_onMoveEnd,_condition] spawn SQFM_fnc_fsmMoveManToPos);
    
} forEach _bldPosArr;

if(_wait)
then{[_scripts,30] call SQFM_fnc_waitForScriptList};

true;