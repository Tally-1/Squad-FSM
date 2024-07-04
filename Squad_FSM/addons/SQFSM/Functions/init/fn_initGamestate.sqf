// Contains global variables used all over the mod.
// I may turn it into a hashmap to allow for OOP programming.

private _objectiveRanges = (entities "SQFSM_Objective")apply{_x getVariable "activationDistance"};
private _maxObjRange     = selectMax _objectiveRanges;

if((-1) in _objectiveRanges
or{_objectiveRanges isEqualTo []})
then{_maxObjRange = worldSize;};

SQFM_headlessPresent    = (entities "HeadlessClient_F") isNotEqualTo [];
SQFM_maxObjectiveRange  = _maxObjRange;
SQFM_validSides         = [east, west, independent];
SQFM_newGroups          = [];
SQFM_deadGroups         = [];
SQFM_battleList         = [];
SQFM_battles            = createHashmapObject [[]];
SQFM_reinforRequests    = createHashmapObject [[]];
SQFM_maxBattleSize      = 1000;
SQFM_minBattleSize      = 100;
SQFM_lastBuildingChange = 0;
SQFM_safePosLifeTime    = 60;