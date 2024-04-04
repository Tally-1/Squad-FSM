params[ 
	["_building", nil, [objNull]]
];
if!(_building isKindOf "House")exitWith{false;};

private _posCount = count (_building buildingPos -1);
if(_posCount < 3)exitWith{false;};

true;