// This function will return a list of positions and objects.
// In the case that the entity has LOS on the target the target itself will be included in the list.
// If there is no LOS then the function will attempt to find a position within 10m(3D) to be suppressed.
params[ 
    ["_entity",    nil, [objNull]], // Man or vehicle whos known targets will be used.
    ["_radius",    nil,       [0]], // zone radius
    ["_center",    nil,      [[]]], // zone center (if nil the position of the entity is used)
    ["_knownOnly", false,  [true]]
];
if(isNil "_center")then{_center = eyePos _entity};
private _targets = [];
private _list    = _center nearEntities['land',_radius];
{
    // Will return position ASL, the target-entity queried or the building occupied by said entity. 
    // If invalid then nil value is returned.
	private _valid  = [_entity, _x] call SQFM_fnc_validEnemy;
	if(_valid)then{
    private _target = [_entity, _x, _knownOnly] call SQFM_fnc_getSuppressionTarget;
    if(!isNil "_target")
    then{_targets pushBackUnique _target};
    
}} forEach _list;

if(isNil "_targets")      exitWith{[]};
if(_targets isEqualTo []) exitWith{[]};

_targets = [_targets, [], {[_x] call SQFM_fnc_suppressionTargetValue}, "DESCEND"] call BIS_fnc_sortBy;

_targets;