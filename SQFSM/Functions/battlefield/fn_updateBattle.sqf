private _pos         = _self get "position";
private _rad         = _self get "radius";
private _zone        = _self get "zone";
private _entities    = (_pos nearEntities ["land", _rad])select {[_x] call SQFM_fnc_validLandEntity};
private _objDataArr  = [_entities] call SQFM_fnc_objArrData;
private _sides       = _objDataArr#3;
private _groups      = _objDataArr#4;
private _hostileToEast = _groups select {[east, _x] call SQFM_fnc_hostile};
private _hostileToGuer = _groups select {[independent, _x] call SQFM_fnc_hostile};
private _hostileToWest = _groups select {[west, _x] call SQFM_fnc_hostile};
private _reinforGrps = _self get "activeReinforcements";
private _allGroups   = [];

_allGroups insert [0, (_self get "groups"), true];
_allGroups insert [0, _groups, true];

_self call ["handleNewGroups",[_groups]];
_self call ["handleInvalidGrps",[_allGroups]];

_self set  ["sides",                       _sides];
_self set  ["groups",                     _groups];
_self set  ["groupsHostileToEast", _hostileToEast];
_self set  ["groupsHostileToGuer", _hostileToGuer];
_self set  ["groupsHostileToWest", _hostileToWest];
_self set  ["entities",                 _entities];

_self call ["updateBuildings"];
_self call ["shareKnowledge"];

private _strengthData      = _self call ["updateStrengthData"];
private _reinforcementData = _self call ["updateReforData"];
private _stengthEast       = _self call ["strengthSide", east];
private _stengthGuer       = _self call ["strengthSide", independent];
private _stengthWest       = _self call ["strengthSide", west];

_self call ["reinforcements"]; 
_self call ["replenishGroups"];
_self call ["callArtillery"];
_self call ["battleTaskGroups"];

_self set  ["strengthEast",  _stengthEast];
_self set  ["strengthGuer",  _stengthGuer];
_self set  ["strengthWest",  _stengthWest];
_self set  ["updateTime",            time];

// The updated data needs to be global before the battleHUD can be broadcasted
// [missionNamespace,"SQFM_battles",SQFM_battles] call setGlobalVar;
if(SQFM_battlePublicVar)
then{publicVariable "SQFM_battles"}
else{
	private _battles = missionNamespace getVariable "SQFM_battles";
	private _pos     = _self get "position";
	
	_battles set [_pos, _self];
	missionNamespace setVariable ["SQFM_battles", _battles];

	call SQFM_fnc_globalizeBattles;
};

_self call ["broadcastBattleHud"]; 

true;