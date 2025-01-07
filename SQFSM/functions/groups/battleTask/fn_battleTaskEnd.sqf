params[
    ["_restart",nil,[false]]
];
private _group = _self get "group";
private _data  = _group call getData;
private _type  = _self get "type";

if(isNil "_data")exitWith{};

if(_type in ["flank", "hold"])
then{_self call ["endFlanking"]};
    
_data call ["deleteWaypoints"];
_data deleteAt "battleTask";

if(_restart)exitWith{
    _data call["flashAction",   ["New Battletask"]];
    _data call["initBattleTask",         [_battle]];
};

_data call ["flashAction", ["Battletask ended"]];

true;