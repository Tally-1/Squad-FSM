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
    displayName  = "Can Hunt";
    tooltip      = "When available, the squad will seek and destroy known enemies within 1000m.";
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