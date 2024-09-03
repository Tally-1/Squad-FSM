class reforce_SquadCount : Combo
{
    property     = "SQFSM_reforce_SquadCount";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Squad Count";
    tooltip      = "The total number of squads this module holds. Once this limit has been reached no new squads will be spawned by this module.";
    typeName     = "NUMBER";
    defaultValue = "-1";
    
    // Listbox items:
    class Values
    {
        class unlimited
        {
            name = "Unlimited";
            value = -1;
        };

        #include "..\includes\numbers_1_to_5.hpp"
        #include "..\includes\numbers_5_to_10.hpp"
    };
};