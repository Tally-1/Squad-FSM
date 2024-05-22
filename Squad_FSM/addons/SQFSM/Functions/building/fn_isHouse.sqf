params[ 
	["_building",  nil, [objNull]],
    ["_ignoreAlt", false, [false]]
];
if!(_building isKindOf "House")exitWith{false;};

private _posCount = count (_building buildingPos -1);
if(_posCount < 3)exitWith{false;};

if(_ignoreAlt)exitWith{true;};

private _buildingAltitude = (getPosATLVisual _building)#2;
if(_buildingAltitude < (0-5))exitWith{false;};

true;