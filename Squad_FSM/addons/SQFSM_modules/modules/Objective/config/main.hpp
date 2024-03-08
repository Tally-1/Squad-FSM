class SQFSM_Objective : Module_F
{
    #include "header.hpp"

    class AttributeValues
    {
        size3[]={50,50,50};
        isRectangle=1;
    };

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\sideCheckboxes.hpp"
        #include "settings\objectiveType.hpp"
        #include "settings\assetType.hpp"
        #include "settings\assetCount.hpp"
        #include "settings\Activation_distance.hpp"
       
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};