params[
    ["_battle",nil,[createHashmap]]
];
private _available = _self call ["canGetBattleTask"];
if(!_available)exitWith{};


private _task = _self get "battleTask";
if(!isNil "_task")exitWith{_task call ["update"]};

if(_self call ["hasTask"])exitWith{
   private _task = _self call ["getTaskData"];
    _task call ["abort",["battleTask"]];
    _self call ["deleteWaypoints"];
};

_self call ["initBattleTask",[_battle]];

true;