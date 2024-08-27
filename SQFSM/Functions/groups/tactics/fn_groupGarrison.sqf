params[
    ["_postActionTxt",nil,[""]],
	["_radius", 60]
];
private _rad       = 60;
private _pos       = _self call ["getAvgPos"];
private _men       = _self call ["getUnitsOnfoot"];
if(_men isEqualTo [])
exitWith{false};

if(typeName _radius isEqualTo "SCALAR")
then{_rad = _radius};

private _buildings = [_pos, _rad,true,_men] call SQFM_fnc_nearBuildings;

if(_buildings isEqualTo [])
exitWith{false};

private _target = _buildings#0;
private _gotIn  = _self call ["getInBuilding",[_target, true]];

if(!isNil "_postActionTxt")
then{_self set ["action", _postActionTxt]};

if!(_gotIn)then{
    _self call ["flashAction",["FAIL","#fb3737"]];
};

_gotIn;