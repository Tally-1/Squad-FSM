private _pos         = _self get "position";
private _rad         = _self get "radius";
private _zone        = _self get "zone";
private _entities    = (_pos nearEntities ["land", _rad])select {[_x] call SQFM_fnc_validLandEntity};
private _objDataArr  = [_entities] call SQFM_fnc_objArrData;
private _sides       = _objDataArr#3;
private _groups      = _objDataArr#4;
private _reinforGrps = _self get "activeReinforcements";
private _allGroups   = [];

_allGroups insert [0, (_self get "groups"), true];
_allGroups insert [0, _groups, true];

_self call ["handleNewGroups",[_groups]];
_self call ["handleInvalidGrps",[_allGroups]];

_self set  ["sides",   _sides];
_self set  ["groups", _groups];
_self call ["updateBuildings"];

private _strengthData      = _self call ["updateStrengthData"];
private _reinforcementData = _self call ["updateReforData"];

_self call ["reinforcements"]; 
_self call ["replenishGroups"];

// The updated data needs to be global before the battleHUD can be broadcasted
publicVariable "SQFM_battles";
_self call ["broadcastBattleHud"]; 

true;