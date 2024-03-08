class objectiveType : Combo
{
    displayName  = "Objective Type";
    tooltip      = "Select how the module will be activated.";
    typeName     = "STRING";
    defaultValue = """2""";
    
    // Listbox items:
    class Values
    {
        class HQ
        {
            name = "HQ";
            value = """hq""";
        };

        class Ammo_storage
        {
            name = "Ammo storage";
            value = """ammo""";
        };

        class FOB
        {
            name = "FOB";
            value = """hq""";
        };
    };
};