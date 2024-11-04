private _mainDisplay = findDisplay 46;

if(isNull _mainDisplay)then{
	waitUntil {!isNull (findDisplay 46)};
	_mainDisplay = findDisplay 46;
};

_mainDisplay displayAddEventHandler ["KeyDown", {
    private _key  = _this#1;
    private _ctrl = _this#3;
    if(_key isNotEqualTo 1) exitWith{false};
    if(!_ctrl)              exitWith{false};
    call SQFM_fnc_abortPlayerTransport;
}];