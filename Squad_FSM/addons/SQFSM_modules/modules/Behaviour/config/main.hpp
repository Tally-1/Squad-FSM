class SQFSM_Behaviour : Module_F
{
    #include "header.hpp"

    // class AttributeValues
    // {
    //     size3[]={50,50,50};
    //     isRectangle=1;
    // };

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\checkboxes.hpp"
        #include "settings\squadType.hpp"
       
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};