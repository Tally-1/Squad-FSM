params [
    ["_man",nil,[objNull]]
];

private _dmg = _this call SQFM_fnc_noCrashDamage;
if(isNil "_dmg")exitWith{};

if(_dmg isEqualTo 0)then{
    _man allowDamage false;
    _man spawn {_this allowDamage true};
	_man spawn {sleep 0.02; _this allowDamage true};
}
else{_man allowDamage true};

_dmg;