_self call ["mechUnload",[true, true, true, 3]];
_self call ["deleteWaypoints"];

private _group         = _self get "grp";
private _leaderVehicle = vehicle formationLeader leader _group;
private _isMan         = _leaderVehicle isKindOf "caManBase";
if(_isMan)exitWith{};

private _formLoop      = [_leaderVehicle, _group] spawn SQFM_fnc_keepMechFormationLoop;
private _formation     = formation _group;
private _men           = _self call ["getUnitsOnfoot"];


_self set  ["state",           "mech clearing"];
_self set  ["formation",            _formation];
_self set  ["leaderVehicle",    _leaderVehicle];
_self set  ["mechClearing",               true];

_group enableAttack false;
_leaderVehicle forceSpeed 4;
_leaderVehicle lockCargo true;
_group setSpeedMode "LIMITED";
_group setFormation "ECH LEFT";
_group setBehaviourStrong "AWARE";
_group setCombatMode "YELLOW";

_men allowGetIn false;
_leaderVehicle setVariable ["SQFM_formationLoop", _formLoop];


{
	_x disableAI  "AUTOCOMBAT";
	_x disableAI  "TARGET";
	_x setUnitPos "UP";
	if(!isNil "SFSM_fnc_unitData") 
	then{
		[_x, "forcedMovement", true]          call SFSM_fnc_unitData;
		[_x, "action", "Mechanized clearing"] call SFSM_fnc_unitData;
	};

} forEach _men;

true;