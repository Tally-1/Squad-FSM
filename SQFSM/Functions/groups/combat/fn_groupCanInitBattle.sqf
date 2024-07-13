private _group = _self get "grp";
if(_self call ["sinceBattle"] < 30)     exitWith{false;};
if!([_group] call SQFM_fnc_validGroup)  exitWith{false;};

private _man = [_group] call SQFM_fnc_firstValidGroupMember;
if([_man] call SQFM_fnc_posInBattleZone) exitWith{false;};
if(fleeing _man)                         exitWith{false;};

true;