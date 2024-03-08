class activationDistance : Combo
{
    property     = "SQFSM_Objective_activationDistance";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Activation Distance";
    tooltip      = "If within this distance a squad will move towards the objective (when needed)";
    typeName     = "NUMBER";
    defaultValue = "500";
    
    // Listbox items:
    class Values
    {
        #include "..\includes\distances50.hpp"
        #include "..\includes\distances550.hpp"
    };
};