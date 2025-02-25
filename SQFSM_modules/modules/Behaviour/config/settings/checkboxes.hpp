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


class allowBattleTask : Checkbox
{
    property     = "SQFSM_allowBattleTask";
    displayName  = "Allow Battle Tasks";
    tooltip      = "Allow squads to Push, Flank or Hold during battle (may interfere with FIPOs)";
    defaultValue = "true";
};


class allowReinforcementCall : Checkbox
{
    property     = "SQFSM_allowReinforcementCall";
    displayName  = "Can call reinforcements";
    tooltip      = "If checked this squad will be able to call for reinforcements.";
    defaultValue = "true";
};

class allowTransportCall : Checkbox
{
    property     = "SQFSM_allowTransportCall";
    displayName  = "Can call Transport";
    tooltip      = "Enables the squad to call for transport.";
    defaultValue = "true";
};

class useNearVehiclesTransport : Checkbox
{
    property     = "SQFSM_useNearVehiclesTransport";
    displayName  = "Can use near vehicles";
    tooltip      = "Enables the squad to use nearby vehicles for transport.";
    defaultValue = "true";
};

class forceTravelOnFoot : Checkbox
{
    property     = "SQFSM_ForceTravelOnFoot";
    displayName  = "Force Travel On Foot";
    tooltip      = "Force the squad to travel on foot when transport is not available.";
    defaultValue = "false";
};