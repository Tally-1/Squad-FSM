class SQFSM_Behaviour : Module_F
{
    #include "header.hpp"

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\checkboxes.hpp"
        #include "settings\squadType.hpp"
        #include "settings\huntDistance.hpp"
       
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};