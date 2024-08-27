params [
    ["_man",          nil, [objNull]],
    ["_vehicle",      nil, [objNull]],
    ["_wait",         nil,    [true]],
    ["_timeLimit",    time+30,   [0]]
];

[_man] orderGetIn false;
_man   action ["Eject", _vehicle];
unassignVehicle _man;

if!(_wait)exitWith{};
if!(canSuspend)then{"Man eject from vehidle called unscheduled" call dbgm};

private _ejectTimer = time+10;
sleep 3;

waitUntil{
    sleep 1;
    private _command = currentCommand _man;
    private _ejected = isTouchingGround _man
                    && {vehicle _man isEqualTo _man
                    && {_command isNotEqualTo "GET OUT"}};
    
    time > _ejectTimer || _ejected;
};

_man doMove (getPosATLVisual _man);

waitUntil{
    (unitReady _man)
    ||{time >= _timeLimit}
};

if(time >= _timeLimit)
exitWith{false};

true;