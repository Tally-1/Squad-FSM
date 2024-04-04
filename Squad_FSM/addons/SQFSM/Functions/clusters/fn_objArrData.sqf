params [    
    ["_objArr", [], [[]]]
];

private _sides     = [];
private _groups    = [];
private _xArr      = [];
private _yArr      = [];
private _distances = [];

{
	private _pos   =  getPosATLVisual _x;
	private _side  = side _x;
	private _group = group _x;
	
	_xArr   pushBackUnique (_pos#0);
	_yArr   pushBackUnique (_pos#1);

	if(_side in [east,west,independent])
	then{_sides  pushBackUnique _side;};

	if([_group] call SQFM_fnc_validGroup)
	then{_groups pushBackUnique _group;};


} forEach _objArr;

private _avgPos  = [([_Xarr] call SQFM_fnc_average), ([_Yarr] call SQFM_fnc_average), 0];
private _radius  = [_avgPos, _objArr] call SQFM_fnc_clusterRadius;
private _dataArr = [
  _avgPos,
  _radius,
  _objArr,
  _sides,
  _groups
];

_dataArr;