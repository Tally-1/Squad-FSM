params[
    ["_module", nil, [objNull]]
];
private _area   = [_module] call SQFM_fnc_getModuleArea;
private _pos    = _area#0;
private _a      = _area#1;
private _b      = _area#2;
private _dir    = _area#3;
private _radius = selectMax [100,_a,_b];
private _text   = [_module getVariable "objectiveType"] call SQFM_fnc_objectiveDescription;

private _centerMarker = [_pos, _text, 0.8,"mil_objective_noShadow"] call SQFM_fnc_addPosMarker;
private _areaMarker   = [_pos, _a, _b, _dir]  call SQFM_fnc_addRectangleMarker;
private _radiusMarker = [_pos, _radius]       call SQFM_fnc_addCircleMarker;

_radiusMarker setMarkerAlpha 0.5;
_centerMarker setMarkerAlpha 0.5;

[
    _centerMarker, 
    _areaMarker , 
    _radiusMarker
];