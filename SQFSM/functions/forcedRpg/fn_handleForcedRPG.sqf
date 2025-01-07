params[
    ["_missile", nil,[objNull]],
    ["_target",  nil,[objNull]]
];
private _targetPos      = eyePos _target;
private _targetAltitude = _targetPos#2;
private _velocityMS     = velocityModelSpace _missile;
private _maxSpeed       = 1000;
private _startSpeed     = round((_velocityMS#1)*0.9);

[_missile, _targetPos] call SQFM_fnc_setDirAndPitchToPos;
_missile setVelocityModelSpace _velocityMS;

if([_missile, _target, 20] call SQFM_fnc_missileAimed)
exitWith{_missile setVelocityModelSpace [0, _maxSpeed, 0];};

while {sleep 0.1; alive _missile} do {
        if(!alive _missile)
        exitWith{};
        if([_missile, _target] call SQFM_fnc_missileAimed)
        exitWith{_missile setVelocityModelSpace [0, _maxSpeed, 0]};
        
        private _altitude  = (getPosASL _missile)#2;
        private _zATL      = (getPosASL _missile)#2;
        private _tooLow    = _altitude < _targetAltitude || _zATL < 0.5;
        private _tooHigh   = _zATL > 2 && {_tooLow isEqualTo false};
        private _velocity  = velocityModelSpace _missile;
        private _distance  = _missile distance2D _targetPos;
        private _dir       = getDirVisual _missile;
        private _targetDir = _missile getDir _targetPos;
        private _deviated  = ([_dir, _targetDir, 20] call SQFM_fnc_inDirRange);

        

        if(_tooLow)then{
            _velocity params ["_drift", "_speed", "_lift"];
            
            _missile setVelocityModelSpace [_drift, _speed, 10];
            _velocity = velocityModelSpace _missile;

            [_missile, _targetPos] call SQFM_fnc_setDirAndPitchToPos;
            _missile setVelocityModelSpace _velocity;
        };

        _velocity params ["_drift", "_speed", "_lift"];
        if(_tooHigh
        &&{_lift > 0})then{
            _missile setVelocityModelSpace [_drift, _speed, 0];
            _velocity = velocityModelSpace _missile;
        };

        if((_velocity#1) < _startSpeed)then{ 
            _velocity params ["_drift", "_speed", "_lift"];

            _missile setVelocityModelSpace [_drift, _maxSpeed, _lift];
            _velocity = velocityModelSpace _missile;
        };

        if(_deviated)then{ 
            [_missile, _targetPos] call SQFM_fnc_setDirAndPitchToPos;
            _missile setVelocityModelSpace _velocity;
        };

        true;
};

true;