class defaultOwner : Combo
{
    property     = "SQFSM_Objective_defaultOwner";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Default Owner";
    tooltip      = "The owner from the start of the game, it can still be captured even if you set this to a specific side.";
    typeName     = "STRING";
    defaultValue = """undefined""";
    

    class Values
    {
        class neutral
        {
            name  = "No owner";
            value = "undefined";
        };

        class Opfor
        {
            name  = "Opfor";
            value = "east";
        };

        class Blufor
        {
            name  = "Blufor";
            value = "west";
        };

        class Guerilla
        {
            name  = "Guerilla";
            value = "independent";
        };        
    };
};