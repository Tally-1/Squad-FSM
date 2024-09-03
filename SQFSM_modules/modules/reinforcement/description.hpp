// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
class ModuleDescription : ModuleDescription
{
    description[] = {
        "Reinforcement module.",
        "Similar to the transport spawner this module must be synched to work.",
        "The group of the synched entity will be stored in the module and spawned in according to the settings in the module",
        "If it is synced to an objective then that objective must be taken by the side of the synched-group in order for it to spawn reinforecemnts"
    };
    
    position  = 2;  // Position is taken into effect
    direction = 2;  // Direction is taken into effect
    optional  = 2;  // synched entity is optional
    duplicate = 0;  // Multiple entities of this type can be synched

    synched[]  = {"AnyPerson", "GroupModifiers"};
};