class objectiveType : Combo
{
    property     = "SQFSM_Objective_objectiveType";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Objective Type";
    tooltip      = "Select how the module will be activated.";
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