if!(_self get "mechClearing")exitWith{};

private _leaderVehicle = _self get "leaderVehicle";
private _script        = _leaderVehicle getVariable "SQFM_formationLoop";
private _formation     = _self get "formation";
private _men           = _self call ["getUnitsOnfoot"];
private _group         = _self get "grp";

// _men allowGetIn true;
_group enableAttack            true;
_leaderVehicle forceSpeed      -1;
_leaderVehicle lockCargo       false;
_leaderVehicle forceFollowRoad false;

_group setSpeedMode "NORMAL";
_group setCombatMode "RED";
_group setFormation _formation;

if(!isNil "_script")
then{terminate _script};

{
	_x enableAI "AUTOCOMBAT";
	_x enableAI "TARGET";
	_x setUnitPos "AUTO";
	// _x setVariable ["SFSM_excluded", false, true];
	if(!isNil "SFSM_fnc_unitData") 
	then{
		[_x, "forcedMovement", false] call SFSM_fnc_unitData;
		[_x, "action", "none"] call SFSM_fnc_unitData;
	};

} forEach _men;


_self set ["mechClearing",false];
_self set ["state",          ""];

"Mech clearing ended" call dbgm;

_leaderVehicle setVariable ["SQFM_formationLoop",nil];