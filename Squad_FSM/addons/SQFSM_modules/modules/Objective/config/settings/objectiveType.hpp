class objectiveType : Combo
{
    property     = "SQFSM_Objective_objectiveType";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Objective Type";
    tooltip      = "Select Objective type.\n\n This may affect AI behaviour.";
    typeName     = "STRING";
    defaultValue = """fob""";
    
    // Listbox items:
    class Values
    {
        class HQ
        {
            name  = "HQ";
            value = "hq";
        };

        class Ammo_storage
        {
            name  = "Ammo storage";
            value = "ammo";
        };

        class FOB
        {
            name  = "FOB";
            value = "fob";
        };
    };
};