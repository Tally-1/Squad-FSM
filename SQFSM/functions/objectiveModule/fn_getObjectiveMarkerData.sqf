params[
    ["_module",nil,[objNull]]
];
private _condition = _module getVariable "markerCondition";
private _showIntel = _module getVariable "showIntel";
private _showFeed  = _module getVariable "showSateliteimage";
private _sides     = [];

if(_module getVariable "showeast")        then{_sides pushBack east};
if(_module getVariable "showindependent") then{_sides pushBack independent};
if(_module getVariable "showwest")        then{_sides pushBack west};

private _dataArr = [
    ["condition",   _condition],
    ["sides",           _sides],
    ["showIntel",   _showIntel],
    ["showFeed",     _showFeed]
];

private _data = createHashmapObject [_dataArr];

_data;