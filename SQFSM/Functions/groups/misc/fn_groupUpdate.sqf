_self call ["setGroupCluster"];
_self call ["setGroupType"];
_self call ["setStrengthIcon"];
_self call ["updateBattleStrength"];
_self call ["setIdleState"];
_self call ["setMapIcon"];

private _group        = _self get "grp";
private _ownerActual  = groupOwner _group;
private _ownerVirtual = _self get "owner";

if(_ownerActual isNotEqualTo _ownerVirtual)then{ 
	[["Group: ", str _group," owner inconsistent ", str ["o",_ownerActual, "v",_ownerVirtual]]] call dbgm;
	_self set ["owner", _ownerActual];
	[_group] call SQFM_fnc_setGroupOwner;
};

_group setVariable ["SQFM_grpData", _self, true];

true;