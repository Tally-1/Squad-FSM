params[
    ["_objective", nil,[objNull]]
];
private _defendFnc = "SQFM_fnc_onInitObjectiveDefenseWp";
private _ownObject = _self get "objective";
private _objData   = _objective call getData;
private _fipos     = _objData call ["getFipos"];

private _endPos    = 
        if(_fipos isEqualTo [])
		then{getPos _objective}
		else{[_fipos] call SQFM_fnc_avgPos2D};

_self call ["removeTask"];
_self call ["deleteWaypoints"];
_self call ["forcedMoveStart"];
_self call ["addWaypoint",[_endPos, 20, "MOVE", _defendFnc,nil,nil,10]];

_self set ["state",  "Objective Defense"];
_self set ["action", "Moving into Defense Position"];
_self set ["travelData", nil];


if(_ownObject isEqualTo _objective)exitWith{};

_self set ["objective", _objective];

true;