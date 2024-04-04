class SQFM_side : Combo
{
    property     = "SQFSM_TransportSpawner_Side";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Side";
    tooltip      = "Select which side will spawn transports from this position";
    typeName     = "STRING";
    defaultValue = """east""";
    
    // Listbox items:
    class Values
    {
        class HQ
        {
            name  = "East";
            value = "east";
        };

        class Ammo_storage
        {
            name  = "West";
            value = "west";
        };

        class FOB
        {
            name  = "Independent";
            value = "independent";
        };
    };
};