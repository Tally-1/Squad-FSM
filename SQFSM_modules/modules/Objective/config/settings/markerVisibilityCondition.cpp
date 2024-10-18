class markerCondition : Combo
{
    property     = "SQFSM_Objective_markerCondition";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Marker visibility";
    tooltip      = "Select when and who will see the marker.";
    typeName     = "STRING";
    defaultValue = """always""";
    
    // Listbox items:
    class Values
    {
        class always
        {
            name = "Always visible";
            value = "always";
        };
        
        class never
        {
            name = "Never visible";
            value = "never";
        };

        class when_active
        {
            name = "When active. If the objective is deactivated by trigger the marker becomes invisible.";
            value = "when_active";
        };

        class when_owned
        {
            name = "When owned. Only visible when the objective is owned by the same side as the player.";
            value = "when_owned";
        };

        class when_hostile
        {
            name  = "When hostile. Only visible when the objective is owned by the enemy";
            value = "when_hostile";
        };
    };
};