params[
    ["_module", nil, [objNull]]
];
private _position    = getPosATLVisual _module;
private _data3d      = [_module] call SQFM_fnc_module3dData;
private _area        = _data3d get "area";
private _radius      = selectMax [100, _area#1, _area#2];
private _zone        = [_position, _radius];
private _zoneLines   = [_position, _radius, 16, [0,1,0,1]] call SQFM_fnc_getCircleLines;
private _type        = _module getVariable "objectiveType";
private _description = [_type] call SQFM_fnc_objectiveDescription;
private _assetType   = _module getVariable "assetType";
private _assetcount  = _module getVariable "assetCount";
private _distance    = _module getVariable "activationDistance";
private _owner       = sideUnknown;
private _sides       = [];

if(_module getVariable "allowEast")        then {_sides pushBack east;};
if(_module getVariable "allowWest")        then {_sides pushBack west;};
if(_module getVariable "allowIndependent") then {_sides pushBack independent;};

(_data3d get "lines")insert [0, _zoneLines, true];

private _assignedGroups = createHashmapObject [[
    ["east",        []],
    ["west",        []],
    ["independent", []]
]];

private _dataArr = [
    ["module",                                               _module],
    ["position",                                           _position],
	["area",                                                   _area],
	["zone",                                                   _zone],
    ["range",                                              _distance],
    ["type",                                                   _type],
    ["description",                                     _description],
    ["asset",                                             _assetType],
    ["count",                                            _assetcount],
    ["owner",                                            sideUnknown],
    ["allowedSides",                                          _sides],
    ["groupsPresent",                                             []],
    ["sidesPresent",                                              []],
	["assignedGroups",                               _assignedGroups],
    ["contested",                                              false],
    ["captureTime",                                             time],

    /*************************{DEBUG DATA}**************************/
    ["defaultIcon",    "\A3\ui_f\data\map\markers\military\objective_CA.paa"],
    ["contestedIcon",    "\A3\ui_f\data\map\markers\military\warning_CA.paa"],
    ["capturedIcon",     "\A3\ui_f\data\map\markers\handdrawn\pickup_CA.paa"],
    ["3dData",                                                       _data3d],
    ["3dColor",                                                    [1,1,1,1]]
];


private _data = createhashMapObject [_dataArr];
[_data] call SQFM_fnc_setObjectiveMethods;

_module setVariable ["SQFM_objectiveData", _data];

_data;