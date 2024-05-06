class allowEast : Checkbox
{
    property     = "SQFSM_Objective_allowEast";
    displayName  = "OPFOR";
    tooltip      = "If checked OPFOR squads will try to attack this position if occupied by an enemy";
    defaultValue = "true";
};

class allowIndependent : Checkbox
{
    property     = "SQFSM_Objective_allowIndependent";
    displayName  = "Independent";
    tooltip      = "If checked Independent squads will try to attack this position if occupied by an enemy";
    defaultValue = "true";
};

class allowWest : Checkbox
{
    property     = "SQFSM_Objective_allowWest";
    displayName  = "BLUFOR";
    tooltip      = "If checked BLUFOR squads will try to attack this position if occupied by an enemy";
    defaultValue = "true";
};