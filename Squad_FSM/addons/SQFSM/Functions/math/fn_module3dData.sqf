params[
	["_module", nil, [objNull]]
];
private _area    = [_module] call SQFM_fnc_getModuleArea;
private _corners = _area     call SQFM_fnc_getAreaCorners; 
private _lines   = _corners  call SQFM_fnc_areaCornerLines;
private _dataArr = [
	["area",         _area],
	["corners",      _corners],
	["lines",        _lines],
	["drawLines",    {{drawLine3D _x}forEach(_self get "lines")}],
	["setLineColor", SQFM_fnc_setModuleLineColor]
];

private _data = createHashmapObject [_dataArr];

_data;