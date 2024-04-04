params [
  ["_center",         nil,        [[]]],
  ["_clusterMembers", nil, [[objNull]]]
];

if(count _clusterMembers < 2)exitWith{2};
private _distances = [];

{
	private _dist = _x distance2D _center;
	_distances pushback _dist;
} forEach _clusterMembers;

private _clusterRadius = selectMax _distances;

if(isNil "_clusterRadius")then{_clusterRadius = 2};

_clusterRadius;