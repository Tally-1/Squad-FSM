_self call ["setActivationStatus"];

if!(_self get "activated")
exitWith{};

_self call ["setContested"];
_self call ["removeSafePosSearches"];

private _contested      = _self get "contested";
private _previousOwner  = _self get "owner";
private _previousGroups = _self get "groupsPresent";
private _previousSides  = _self get "sidesPresent";

private _currentGroups = _self call ["getGroupsInZone"];
private _currentSides  = _self call ["getSidesInZone"];
private _currentOwner  = _currentSides#0;

if(isNil "_currentOwner")
exitWith{};

_self set ["sidesPresent",  _currentSides];
_self set ["groupsPresent", _currentGroups];

if(_self call ["timeSinceCapture"] <= 5)
exitWith{_self call ["globalize"]};

if(_previousOwner isNotEqualTo _currentOwner
&&{_contested isEqualTo false})
then{
	_self call ["onCapture",[_currentOwner]];
	_self call ["globalize"];
};

true;