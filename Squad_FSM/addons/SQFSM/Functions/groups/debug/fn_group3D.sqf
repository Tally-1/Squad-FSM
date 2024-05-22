params [
	["_group", nil, [grpNull]]
];
private _data      = _group getVariable "SQFM_grpData";
if(isNil "_data")
exitwith{[_group] call SQFM_fnc_group3DNoData;};

private _eyePos    = ASLToATL aimPos vehicle leader _group;
private _iconPos   = [_eyePos, 2] call SQFM_fnc_AddZ;
private _icon      = [_group] call SQFM_fnc_group3DIcon;//"\A3\ui_f\data\map\groupicons\selector_selectedFriendly_ca.paa";
private _color     = [_group] call SQFM_fnc_group3DColor;
private _text      = [_group] call SQFM_fnc_group3DText;
private _camPos    = (positionCameraToWorld [0,0,0]);
private _objective = _data get "objective";
private _strength  = _data get "strengthIndicator";

if(isNil "_icon")then{_icon = ""};
if(isNil "_text")then{_text = ""};

//Main 3D Icon.
drawIcon3D[_icon,_color,_iconPos,2,2,0,_text,2,0.04];

// Inner text.
drawIcon3D[_strength,[1,1,1,1],_iconPos,1.5,1.5,0,(_data get"groupType"),2,0.03];

if(isNull (findDisplay 312))exitWith{};

// line between squad-leader and icon
drawLine3D [_eyePos, _iconPos, _color];

if(!isNull _objective)then{
    private _aqua    = [0.4,1,0.9,1];
    private _obPos   = getPosATL _objective;
    private _lineEnd =[_obPos#0,_obPos#1,10];
    drawLine3D [_iconPos, _lineEnd, _aqua];
    drawLine3D [_lineEnd, _obPos,   _aqua];
};

[_group] call SQFM_fnc_units3D;