_self call ["setContested"];

private _contested      = _self get "contested";

private _previousOwner  = _self get "owner";
private _previousGroups = _self get "groupsPresent";
private _previousSides  = _self get "sidesPresent";
private _currentGroups  = _self call ["getGroupsInZone"];

if(_contested     isEqualTo false
&&{_currentGroups isEqualTo _previousGroups})
exitWith{};

private _currentSides = [_currentGroups] call SQFM_fnc_sidesFromGroupArr;
private _currentOwner =  _currentSides#0;

if(isNil "_currentOwner")
exitWith{};

_self set ["sidesPresent",  _currentSides];
_self set ["groupsPresent", _currentGroups];

if(_self call ["timeSinceCapture"] <= 5)
exitWith{};

if(_previousOwner isNotEqualTo _currentOwner
&&{_contested isEqualTo false})
then{
    private _color = [_currentOwner] call SQFM_fnc_sideColor;
    _self set ["3dColor",         _color];
    _self set ["owner",    _currentOwner];
    _self set ["captureTime", round time];
    "Objective was captured!" call dbgm;
};

true;