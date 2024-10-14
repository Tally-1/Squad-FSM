class exclude : Checkbox
{
    property     = "SQFSM_exclude";
    displayName  = "Exclude from SQFSM";
    tooltip      = "If checked this squad will be excluded from Squad FSM";
    defaultValue = "false";
};


class idleCover : Checkbox
{
    property     = "SQFSM_idleCover";
    displayName  = "Take cover when Idle";
    tooltip      = "When a squad is considered Idle it will look for good positions to take cover.";
    defaultValue = "true";
};


class allowObjectiveCapture : Checkbox
{
    property     = "SQFSM_allowObjectiveCapture";
    displayName  = "Capture Objectives";
    tooltip      = "If checked this squad will try to capture enemy and neutral objectives";
    defaultValue = "true";
};

class allowObjectiveDefense : Checkbox
{
    property     = "SQFSM_allowObjectiveDefense";
    displayName  = "Defend Objectives";
    tooltip      = "If checked this squad will try to defend friendly objectives\nIf it has captured an objective it will stay in it.";
    defaultValue = "true";
};

class allowObjectiveClearing : Checkbox
{
    property     = "SQFSM_allowObjectiveClearing";
    displayName  = "Clear Objectives";
    tooltip      = "If checked this squad will sweep the objective attempting to clear out enemies.";
    defaultValue = "true";
};

class isReinforcement : Checkbox
{
    property     = "SQFSM_isReinforcement";
    displayName  = "Can reinforce";
    tooltip      = "When available, the squad will respond to reinforcement calls.";
    defaultValue = "true";
};

class canHunt : Checkbox
{
    property     = "SQFSM_canHuntt";
    displayName  = "Push near enemies";
    tooltip      = "When available, the squad will seek and destroy near enemies.\nYou can set the distance below.";
    defaultValue = "true";
};

class allowArtySupportCall : Checkbox
{
    property     = "SQFSM_allowArtySupportCall";
    displayName  = "Can call Artillery";
    tooltip      = "If checked this squad will be able to call for artillery support.";
    defaultValue = "true";
};

class allowAirSupportCall : Checkbox
{
    property     = "SQFSM_allowAirSupportCall";
    displayName  = "Can call CAS";
    tooltip      = "If checked this squad will be able to call for Close Air Support.";
    defaultValue = "true";
};

class allowReinforcementCall : Checkbox
{
    property     = "SQFSM_allowReinforcementCall";
    displayName  = "Can call reinforcements";
    tooltip      = "If checked this squad will be able to call for reinforcements.";
    defaultValue = "true";
};