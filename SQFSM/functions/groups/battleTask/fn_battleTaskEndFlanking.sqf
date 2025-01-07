private _group = _self get "group";
private _data  = _group call getData;
_data call ["enableAttack"];
_data call ["toggleExternalAi",[true]];

true;