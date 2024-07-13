addMissionEventHandler ["BuildingChanged", 
{
params [
    ["_old",    nil, [objNull]], // Building it changes from    (Original building).
    ["_new",    nil, [objNull]], // Building it changes to      (New building).
    ["_isRuin", nil,    [true]]  // If the new buildng is ruins (Last stage of change).
];
if(time - SQFM_lastBuildingChange < 1)exitWith{};
private _isHouse   = [_new] call SQFM_fnc_isHouse;
private _oldIsHoue = [_old, true] call SQFM_fnc_isHouse;

if(_isHouse   isEqualTo false
&&{_oldIsHoue isEqualTo false}) exitWith{};

if(_isRuin)
then{"Building destroyed" call dbgm;}
else{"Building damaged"   call dbgm;};

SQFM_lastBuildingChange = time;

private _pos          = getPosATLVisual _old;
private _battlePosRad = [_pos] call SQFM_fnc_nearestBattlePosRad;
if(isNil "_battlePosRad")exitWith{};

_battlePosRad
params [
    ["_battlePos", nil,[[]]],
    ["_battleRad", nil, [0]]
];

private _inBattle = (_pos distance2D _battlePos) < _battleRad;
if!(_inBattle)exitWith{};

private _battleMap = SQFM_battles get _battlePos;
_battleMap spawn{
	sleep 0.3;
	_this call ["updateBuildings"];
	sleep 0.7;
	_this call ["updateBuildings"];
};

true;
}];