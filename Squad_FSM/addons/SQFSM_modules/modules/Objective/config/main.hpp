class SQFSM_Objective : Module_F
{
    #include "header.hpp"

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\objectiveType.cpp"
        #include "settings\sideCheckboxes.cpp"
        #include "settings\ActivationDistance.cpp"
        #include "settings\strengthCoef.cpp"
        #include "settings\assetTypes.cpp"
        
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};