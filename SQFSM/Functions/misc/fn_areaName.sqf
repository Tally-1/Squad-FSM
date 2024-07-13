params[
    ["_pos",    nil, [[]]],
    ["_radius", 1000, [0]]
];

private _locationNamePos = [_pos] call SQFM_fnc_closestLocationName;
private _locName         = _locationNamePos # 0;
private _locPos          = _locationNamePos # 1;

if((toLower _locName) isEqualTo "unknown")then{_locPos = _pos};

private _strDir             = [(_locPos getDir _pos)] call SQFM_fnc_describeDir;
private _distance        = _locPos distance2D _pos;
private _strDist         = [_distance] call SQFM_fnc_describeDistance;
private _areaName        = [_strDist, " ", _strDir, " of ", _locName] joinString "";

if(_distance < 300)then{_areaName = _locName};

_areaName;