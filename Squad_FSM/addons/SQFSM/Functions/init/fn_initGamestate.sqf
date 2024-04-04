// Contains global variables used all over the mod.
// I may turn it into a hashmap to allow for OOP programming.
private _objectiveRanges = (entities "SQFSM_Objective")apply{_x getVariable "activationDistance"};
private _maxObjRange     = selectMax _objectiveRanges;

SQFM_maxObjectiveRange = _maxObjRange;
SQFM_newGroups         = [];
SQFM_deadGroups        = [];
SQFM_battleList        = [];
SQFM_validSides        = [east, west, independent];
SQFM_battles           = createHashmapObject [[]];