private _type    = _self get "type";
private _pos     = _self get "pos";
private _dir     = _self get "dir";
private _id      = _self get "id";
private _vehicle = _type createVehicle _pos;

_vehicle setDir _dir;
_vehicle setVariable ["SQFM_virtualId", _id];

{_x addCuratorEditableObjects [[_vehicle],true]} forEach allCurators;

_vehicle;