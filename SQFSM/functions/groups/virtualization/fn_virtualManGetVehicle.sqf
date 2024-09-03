private _id = _self get "vehicleId";
if(_id isEqualTo "")exitWith{objNull};

private _index = vehicles findIf {(_x getVariable ["SQFM_virtualId",""])isEqualTo _id};
if(_index isEqualTo -1)exitWith{objNull};

private _vehicle = vehicles#_index;

_vehicle;