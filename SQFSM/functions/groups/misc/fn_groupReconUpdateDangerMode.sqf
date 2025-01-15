params[
    ["_enemies",nil,[[]]]
];
private _group       = _self get "grp";
private _men         = _self call ["getUnitsOnfoot"];
private _pos         = _self call ["getAvgPos"];
private _behaviour   = combatBehaviour _group;
private _speed       = speedMode _group;
private _combatMode  = combatMode _group;
private _holdFire    = _combatMode isEqualTo "GREEN";
private _side        = side _group;
private _danger      = (_enemies isNotEqualTo [] 
                        || {_self call ["inBattle"] 
                        ||{[_side, _pos, 300] call SQFM_fnc_posIsHostile
                        }});

private _modeChange  = _danger != (_self get "reconDanger");
private _wantedBeh   = "AWARE";
private _wantedSpeed = "NORMAL";

if(!_holdFire) then{_group setCombatMode "GREEN"};
if(_danger)    then{
    _wantedSpeed = "LIMITED";
    _wantedBeh  = "STEALTH";
};

{
    private _hasTarget = !isNull (getAttackTarget _x);
    private _setMode   = (unitCombatMode _x) isNotEqualTo "GREEN";
    if(_setMode)then{_x setUnitCombatMode "GREEN"};
    
} forEach _men;

if(_behaviour isNotEqualTo _wantedBeh) then{_group setBehaviour _wantedBeh};
if(_speed isNotEqualTo _wantedSpeed)   then{_group setSpeedMode _wantedSpeed};

_self set ["reconDanger", _danger];

if(_modeChange)then{
    private _text = "Recon mode: SAFE";
    private _color = "#83ff7f";
    if(_danger)then{
        _text = "Recon mode: DANGER";
        _color = "#e51313";
    };
    _text call dbgm;
    _self call ["flashAction", [_text, _color, 3]];
};