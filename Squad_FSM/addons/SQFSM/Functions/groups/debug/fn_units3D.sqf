params [
	["_group", nil, [grpNull]]
];
private _units = units _group select {
	_camPos distance2D _x < 100 
	&&{currentCommand _x isNotEqualTo ""
	&&{vehicle _x isEqualTo _x}}
};

{
	drawIcon3D[
		"",
		[1,1,1,1],
		getPosATLVisual _x,
		1, 
		1, 
		0,  
		currentCommand _x, 
		2,
		0.035
	];

} forEach _units;
