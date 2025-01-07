params [
    ["_man", nil, [objNull]]
];
if!(_man isKindOf "caManBase")exitWith{};
private _vanillaDest = (expectedDestination _man)#0;
private _fsmDest     = (_man getVariable ["FSM_moveParams",   []])#0;
private _path        = _man  getVariable ["SFSM_currentPath", []];
private _darkGreen   = [0.1,0.5,0,0.8];
private _green       = [0.3, 0.9, 0.3, 1];
private _orange      = [0.85,0.4,0,0.8];
private _pathColor   = [0.7,0.7,0.7,0.9];
private _pathIcon    = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
private _showVanilla = _vanillaDest distance2D _man > 1;
private _showFSM     = !isNil "_fsmDest" &&{_fsmDest distance2D _man > 1};
private _showPath    = count _path > 0;
private _sameDest    = _showFSM && {_showVanilla &&{_vanillaDest isEqualTo _fsmDest}};

if(_showPath)then{
    {
        private _index = str _forEachIndex;
        private _pos   = _x;
        [_pos, _pathColor, _index, _pathIcon, 0.3] call SQFM_fnc_draw3DMarker;

    } forEach _path;
};

if(_sameDest)
exitWith{[_vanillaDest, _green, "Destination"] call SQFM_fnc_draw3DMarker};

if(_showVanilla)
then{[_vanillaDest, _darkGreen, "Destination (Bohemia)"] call SQFM_fnc_draw3DMarker};

if(_showFSM)
then{[_fsmDest, _orange, "Destination (DCO)"] call SQFM_fnc_draw3DMarker};

true;