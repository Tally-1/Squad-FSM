class max_simultaneous : Combo
{
    property     = "SQFSM_max_simultaneous";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Max simultaneous count";
    tooltip      = "Defines how many squads this module may field at the same time.";
    typeName     = "NUMBER";
    defaultValue = "2";
    

    class Values
    {
        class one
        {
            name  = "1";
            value = 1;
        };

        class two
        {
            name  = "2";
            value = 2;
        };

        class three
        {
            name  = "3";
            value = 3;
        };

        class four
        {
            name  = "4";
            value = 4;
        };
    };
};