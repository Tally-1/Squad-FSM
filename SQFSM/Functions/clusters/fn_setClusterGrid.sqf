private _pos   = _self get "position";
private _rad   = ceil (_self get "radius")*1.1;
private _z     = 0;
private _grid  = [
	_pos,
	_rad,
	_rad,
	2
] call SQFM_fnc_squareGrid;

private _posRadius = _grid#0 distance2D (_grid#1);
_grid = [_grid, [], {count (_x nearEntities ["land", _posRadius])}, "ASCEND"] call BIS_fnc_sortBy;

_self set ["grid", _grid];

true;