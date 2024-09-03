class SQFSM_Reforcer : Module_F
{
    #include "header.hpp"

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        #include "settings\range.cpp"
        #include "settings\max_simultaneous.cpp"
        #include "settings\SquadCount.cpp"
        
        class ModuleDescription : ModuleDescription{};
    };

    #include "description.hpp"
};