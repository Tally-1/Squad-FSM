params[
    ["_objective", nil,[objNull]]
];
private _objData = _objective call getData;
private _exits   = (_objData get "roadmap"get"exitPositions");
private _men     = _self call ["getUnitsOnfoot"];
private _zone    = _objData get"zone";
private _fipos   = ((_zone#0) nearEntities ["SFSM_FIPO", (_zone#1)]) select {_x inArea _area};
private _endPos  = if(_fipos isEqualTo [])
				   then{getPos _objective}
				   else{[_fipos] call SQFM_fnc_avgPos2D};

_self call ["assignObjectiveFipos",[_objective]];
_self call ["assignObjectiveTurrets",[_objective]];

(_self get "grp") move _endPos;

true;