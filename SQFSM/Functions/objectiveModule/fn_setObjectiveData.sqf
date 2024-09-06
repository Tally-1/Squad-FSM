params[
    ["_module", nil, [objNull]]
];
private _position     = getPosATLVisual _module;
private _data3d       = [_module] call SQFM_fnc_module3dData;
private _type         = _module getVariable "objectiveType";
private _area         = _data3d get "area";
private _radius       = if(_type isEqualTo "dp")then{selectMax [_area#1, _area#2]}else{selectMax [100, _area#1, _area#2]};
private _zone         = [_position, _radius];
private _zoneLines    = [_position, _radius, 16, [0,1,0,1]] call SQFM_fnc_getCircleLines;
private _description  = [_type] call SQFM_fnc_objectiveDescription;
private _capStrength  = _module getVariable "capStrength";
private _distance     = _module getVariable "activationDistance";
private _defaultOwner = _module getVariable "defaultOwner";
private _buildings    = [_position, _radius] call SQFM_fnc_nearBuildings;
private _isUrbanArea  = (_type isEqualTo "town");//||{[_position, _radius, _buildings] call SQFM_fnc_isUrbanArea};
private _urbanZones   = [_buildings] call SQFM_fnc_getUrbanZones;
private _owner        = sideUnknown;
private _sides        = [];
private _assetTypes   = [];
private _markers      = if(SQFM_debugMode)then{[_module] call SQFM_fnc_drawObjectiveMarkers}else{[]};

if (_defaultOwner isNotEqualTo "undefined")
then{_owner = (call compile _defaultOwner)};

if(_module getVariable "allowEast")              then {_sides pushBack east;};
if(_module getVariable "allowWest")              then {_sides pushBack west;};
if(_module getVariable "allowIndependent")       then {_sides pushBack independent;};

if(_type isEqualTo "recon")
then{_assetTypes = ["recon"]}
else{ 
    if(_module getVariable "allowreconcapture")      then {_assetTypes pushBack "recon";};
    if(_module getVariable "allowinfantrycapture")   then {_assetTypes pushBack "infantry";};
    if(_module getVariable "allowcarcapture")        then {_assetTypes pushBack "cars";};
    if(_module getVariable "allowlightarmorcapture") then {_assetTypes pushBack "light armor";};
    if(_module getVariable "allowheavyarmorcapture") then {_assetTypes pushBack "heavy armor";};
};


(_data3d get "lines")insert [0, _zoneLines, true];

private _assignedGroups = createHashmapObject [[
    ["east",        []],
    ["west",        []],
    ["independent", []]
]];

private _dataArr = [
    ["module",                                               _module],
    ["markers",                                             _markers],
    ["position",                                           _position],
    // ["posgrid",                                                   []],
	["area",                                                   _area],
	["zone",                                                   _zone],
	["buildings",                                         _buildings],
    ["isUrbanArea",                                     _isUrbanArea],
    ["urbanZones",                                       _urbanZones],
    ["roadmap",                   _zone call SQFM_fnc_getZoneRoadmap],
    ["range",                                              _distance],
    ["type",                                                   _type],
    ["description",                                     _description],
    ["assetStrength",                                   _capStrength],
    ["owner",                                                 _owner],
    ["allowedSides",                                          _sides],
    ["allowedAssets",                                    _assetTypes],
    ["groupsPresent",                                             []],
    ["sidesPresent",                                              []],
	["assignedGroups",                               _assignedGroups],
    ["contested",                                              false],
    ["captureTime",                                             time],
    ["safePosSearches",                                           []],

    /*************************{DEBUG-DATA}**************************/
    ["defaultIcon",    "\A3\ui_f\data\map\markers\military\objective_CA.paa"],
    ["contestedIcon",    "\A3\ui_f\data\map\markers\military\warning_CA.paa"],
    ["capturedIcon",     "\A3\ui_f\data\map\markers\handdrawn\pickup_CA.paa"],
    ["3dData",                                                       _data3d],
    ["3dColor",                           ([_owner] call SQFM_fnc_sideColor)]
];


private _data = createhashMapObject [_dataArr];
[_data] call SQFM_fnc_setObjectiveMethods;
_data   call ["updateMarkers"];

// For some reason the urbanStatus function returns a false negative if called too soon.
_data spawn{sleep 1; _this call ["setUrbanStatus"]};
// _data   call ["setPosgrid"];

_module setVariable ["SQFM_objectiveData", _data, true];

_data;