_this spawn {
params[
    ["_passengerGrp",nil,[grpNull]],
    ["_attackEnemy", true,  [true]]
];
private _passengerData  = _passengerGrp call getData;
private _vehicle        = _passengerData get "transportVehicle";
private _driver         = driver _vehicle;
private _transportGroup = group _driver;
private _men            = units _passengerGrp;
private _timer          = time + count _men;
private _enemyGroup     = _passengerData call ["nearEnemyGrp"];


_driver disableAI "move";
_passengerData call ["ejectAll"];

waitUntil { 
        private _onFoot = _passengerData call ["boardingStatus"] isEqualTo "on foot";
        _onFoot || {_timer<time};
    };

if(!isNull _vehicle)
then{
    (units _passengerGrp) allowGetIn false;
    _passengerGrp leaveVehicle _vehicle;
};

if(!isNull _transportGroup
&&{alive _driver})then{[_transportGroup] spawn SQFM_fnc_onTransportCombatDrop};

"Transport has unloaded passengers" call dbgm;

_driver enableAI "move";
if(isNull _enemyGroup)exitWith{};
if(!_attackEnemy)     exitWith{};

_passengerData call ["attackGroup",[_enemyGroup]];
_passengerData set  ["action", "Attacking enemy"];

true;
};