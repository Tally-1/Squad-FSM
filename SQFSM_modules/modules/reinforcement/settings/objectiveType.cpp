class objectiveType : Combo
{
    property     = "SQFSM_Objective_objectiveType";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Objective Type";
    tooltip      = "Select Objective type.\nThis may affect AI behaviour.\nRecon Objectives will ONLY be used by Recon squads, regardless of other settings.";
    typeName     = "STRING";
    defaultValue = """fob""";
    
    // Listbox items:
    class Values
    {
        class FOB
        {
            name  = "Forward Operating Base";
            value = "fob";
        };

        class DP
        {
            name  = "Defensive Position";
            value = "dp";
        };

        class town
        {
            name  = "Town";
            value = "town";
        };

        class HQ
        {
            name  = "HeadQuarter";
            value = "hq";
        };

        class supplies
        {
            name  = "Supply Point";
            value = "supplies";
        };

        class recon
        {
            name  = "Recon";
            value = "recon";
        };

        class op
        {
            name  = "Observation Post";
            value = "op";
        };        
    };
};