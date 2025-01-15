params[
    ["_enemies",nil,[[]]]
];
private _side          = _self get "side";
private _clusterRadius = selectMax [50, SQFM_artySpread];
private _clusters      = [_enemies, _clusterRadius] call SQFM_fnc_clustersFromObjArr;
private _validClusters = _clusters select {
    private _position    = _x get "position";
    private _validPos    = [_position, _side] call SQFM_fnc_artilleryValidStrikePos;
    private _objectCount = count (_x get "objects");
    private _include     = _validPos &&{_objectCount > 2};
    private _txt         = [(if(_include)then{"valid"}else{"invalid"})," Strike pos (",_objectCount," targets)"]joinString"";
    private _color       = if(_include)then{[1,0,0,1]}else{[0,0,1,0.5]};

    _include;
};

_validClusters = [_validClusters, [], {count (_x get "objects")}, "DESCEND"] call BIS_fnc_sortBy;

private _positions = _validClusters apply {_x get "position"};

_positions;