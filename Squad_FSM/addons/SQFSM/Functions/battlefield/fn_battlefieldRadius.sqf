params [
	["_pos",        nil, [[]]], 
	["_baseRadius", nil,  [0]]
];
private _returnRadius = _baseRadius;
private _checkRadius  = _baseRadius*2;

if(_checkRadius < 300)then{_checkRadius = 300};
private _entities = _pos nearEntities ['land', _checkRadius];

private _filter = {
	private _grpData = group _x getVariable "SQFM_grpData";
	private _valid   = (!isNil "_grpData" && {[_x] call SQFM_fnc_validLandEntity && {!(_grpData call ["inBattle"])}});

	_valid;
};

_entities = _entities select _filter;
private _maxRadius = [_pos, _entities] call SQFM_fnc_clusterRadius;

if  (_baseRadius   < _maxRadius)
then{_returnRadius = _maxRadius};

_returnRadius = ceil(_returnRadius*1.33);

_returnRadius;