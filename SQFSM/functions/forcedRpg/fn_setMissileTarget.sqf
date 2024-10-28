params[
    ["_projectile", nil,[objNull]],
    ["_target",     nil,[objNull]]
];
_projectile setMissileTarget _target;
private _stage = (missileState _projectile)#0;
if(_stage isEqualTo "INIT")then{
    waitUntil { 
        sleep 0.1;
        _stage = (missileState _projectile)#0;
        if(isNil "_stage")exitWith{true};

        _stage isNotEqualTo "INIT";
    };
};

_projectile setMissileTarget _target;

private _exitCode = { "Missile target set" call dbgm; _projectile setVelocityModelSpace [0,0,10]};

sleep 0.1;

private _valid    = (missileTarget _projectile)isEqualTo _projectile;
if(_valid)exitWith _exitCode;

private _targetPos = ASLToATL eyePos _target;
_projectile setMissileTargetPos _targetPos;

_valid = (missileTargetPos _projectile)isEqualTo _targetPos;
if(_valid)exitWith _exitCode;

"Missile lock failed" call dbgm;
_projectile setVelocityModelSpace [0,0,20];
_this spawn SQFM_fnc_handleForcedRPG;