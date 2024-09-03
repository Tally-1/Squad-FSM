class reforce_range : Combo
{
    property     = "SQFSM_reforce_range";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Reinforcement Range";
    tooltip      = "The max distance this module will reinforce, calls outside this distance will not be accepted.";
    typeName     = "NUMBER";
    defaultValue = "5000";
    
    // Listbox items:
    class Values
    {
        class unlimited
        {
            name = "Unlimited";
            value = -1;
        };
        #include "..\includes\distances50.hpp"
        #include "..\includes\distances550.hpp"
        #include "..\includes\distances3500.hpp"
        #include "..\includes\distances8000.hpp"
    };
};