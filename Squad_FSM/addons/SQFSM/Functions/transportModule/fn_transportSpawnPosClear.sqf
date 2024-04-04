private _bottom  = _self get"pos"; if(_bottom#2<0)then{_bottom = [_bottom#0,_bottom#1,0.1]};
private _z       = _self get"shape"get"height";
private _centerZ = _z/2;
private _xx      = (_self get"shape"get"width")/1.8;
private _yy      = (_self get"shape"get"length")/2;
private _top     = [_bottom#0,_bottom#1, (_bottom#2)+_z];
private _mid     = [_bottom#0,_bottom#1, (_bottom#2)+_centerZ];
private _dir     = _self get"dir";
private _front   = [_mid, _dir,        _yy, _centerZ] call SQFM_fnc_sinCosPos;
private _back    = [_mid,(_dir - 180), _yy, _centerZ] call SQFM_fnc_sinCosPos;
private _left    = [_mid,(_dir - 90),  _xx, _centerZ] call SQFM_fnc_sinCosPos;
private _right   = [_mid,(_dir + 90),  _xx, _centerZ] call SQFM_fnc_sinCosPos;

if(lineIntersectsSurfaces [ATLToASL _bottom, ATLToASL _top]   isNotEqualTo []) exitWith{false};
if(lineIntersectsSurfaces [ATLToASL _left,   ATLToASL _right] isNotEqualTo []) exitWith{false};
if(lineIntersectsSurfaces [ATLToASL _back,   ATLToASL _front] isNotEqualTo []) exitWith{false};

true;