private _prevStatus = _self get "activated";
private _status     = _self call ["getTriggerActivationStatus"];
private _newStatus  = _prevStatus isNotEqualTo _status;
private _module     = _self get "module";

_self set ["activated", _status];

if(_newStatus)then{
    ["SQFM_ObjectiveActiveChange", [_module, _status]] call CBA_fnc_localEvent;
    _self call ["globalize"];
};

_status;