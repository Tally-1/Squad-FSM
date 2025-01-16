private _caller      = _self get "callerGrp";
private _missionId   = _self get "missionId";
// private _strikeDebug = SQFM_activeArtyRequests get _missionId;

if(!isNull _caller)then{
    private _data = _caller call getData;
    _data set  ["activeArty", objNull];
    _data call ["globalize"];
};

_self set  ["complete", true];
_self call ["globalize"];

true;