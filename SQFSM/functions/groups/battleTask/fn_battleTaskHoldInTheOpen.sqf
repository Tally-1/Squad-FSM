private _formDir = _self call ["getHoldFormDir"];
private _group   = _self get "group";
private _grpData = _group call getData;

_grpData call ["deleteWaypoints"];
_grpData call ["disableAttack"];

_group setFormDir _formDir;
_group setFormation "LINE";
_group setCombatBehaviour "STEALTH";

_self set ["holdInPlace", true];

true;