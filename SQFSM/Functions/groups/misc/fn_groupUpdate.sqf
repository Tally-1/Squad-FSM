private _since = time - (_self get "lastUpdate");
if(_since<1)exitWith{};
_self set ["lastUpdate", time];

private _group        = _self get "grp";
private _playerGroup  = [_group] call SQFM_fnc_isPlayerGroup;
if(_playerGroup)  exitWith{};
if(isNull _group) exitWith{};

private _ownerActual  = groupOwner _group;
private _ownerVirtual = _self get "owner";
private _birth        = _self get "birth";
private _timePassed   = time - _birth;
private _strength     = _self call ["getStrength"];
private _inStrength   = _self get "initialStrength";

if(_timePassed < 5)
then{_self set ["initialStrength", _strength]}
else{if(_inStrength < 1 &&{_strength > 0})
then{_self set ["initialStrength", _strength]}};

_self call ["setGroupCluster"];
_self call ["setGroupType"];
_self call ["setStrengthIcon"];
_self call ["updateBattleStrength"];
_self call ["setIdleState"];
_self call ["setMapIcon"];
_self call ["updateTask"];
_self call ["reconUpdate",[false]];
_self call ["globalize"];

if(_ownerActual isNotEqualTo _ownerVirtual)then{ 
	[["Group: ", str _group," owner inconsistent ", str ["owner: ",_ownerActual, "registered: ",_ownerVirtual]]] call dbgm;
	_self set ["owner", _ownerActual];
	[_group] call SQFM_fnc_setGroupOwner;
};

// Timelimit set in canRegroup function.
if(_self call ["canRegroup",[false,nil]])
then{_self call  ["regroup",[false]]};

true;