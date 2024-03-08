class SFSM_VZ : Module_F
{
    #include "header.hpp"

    class AttributeValues
    {
        size3[]={100,100,50};
        isRectangle=1;
    };

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\objectiveType.hpp"

        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};