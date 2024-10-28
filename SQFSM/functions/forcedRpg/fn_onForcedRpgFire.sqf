params[
    ["_man",    nil,[objNull]],
    ["_weapon", nil,     [""]]
];
private _ammoType   = _this#4;
private _projectile = _this#6;
private _guided     = (getNumber (configfile >> "CfgAmmo" >> _ammoType >> "maneuvrability")) > 1;
private _target     = _man getVariable "SQFM_rpgTarget";

_projectile setVariable ["SQFM_rpgTarget",_target];
_man        setVariable ["SQFM_rpgFired",    true];
_man allowDamage false;

if(_guided)
then{[_projectile, _target] spawn SQFM_fnc_setMissileTarget}
else{[_projectile, _target] spawn SQFM_fnc_handleForcedRPG};

_man spawn{sleep 0.2; _this allowDamage true};

[[name _man, " fired ", _weapon]]call dbgm;