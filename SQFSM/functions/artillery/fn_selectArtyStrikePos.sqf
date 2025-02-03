private _timeLimit = time + 300;
openMap [true, true];
call SQFM_fnc_artySelectPosTip;

SQFM_mapClickEh = 
addMissionEventHandler ["MapSingleClick", {
	private _pos = _this#1;
    [_pos] call SQFM_fnc_endTransportDestinationSelection;
}];

SQFM_keyDownEh = 
(findDisplay 12) displayAddEventHandler ["KeyDown", { 
    private _key = _this#1;
    if(_key isEqualTo 1)exitWith{
        [] call SQFM_fnc_endTransportDestinationSelection;
        true;
    };

    false;
}];

SQFM_transportDestination = nil;
waitUntil {(!visibleMap) ||{_timeLimit < time}};
if(isNil "SQFM_transportDestination")exitWith{};

(SQFM_transportDestination)#0;