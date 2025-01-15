#include "..\misc\textIncludes.sqf";
params[
    ["_vehicle",nil,[objNull]]
];
while {
    private _selected = (curatorSelected#0);
    private _count    = count _selected;
    private _object   = _selected#0;
    private _showHint = !isNil "_object"&&{_object isEqualTo _vehicle &&{_count isEqualTo 1}};
    _showHint;
} do {
private _status     = [_vehicle] call SQFM_fnc_artilleryStatus;
private _hasMission = [_vehicle] call SQFM_fnc_artilleryHasActiveFireMission;
private _textArr    = [
    _center,_largeTxt,"[",_green,"Artillery",_end,"]",_endd,_newLine,
    _left,"Status: ",_end,_right,_status,_end,_newLine
];

hintSilent parseText(_textArr joinString"");

sleep 0.1;
true;
};