class SQFSM_TransportSpawner : Module_F
{
    #include "header.hpp"

    class AttributeValues
    {
        size3[]={20,20,10};
        isRectangle=1;
    };

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\assetCount.hpp"
        #include "settings\side.hpp"
       
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};