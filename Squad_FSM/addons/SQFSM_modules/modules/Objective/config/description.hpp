// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
class ModuleDescription : ModuleDescription
{
    description[] = {
    "Objective module.",
    "Squads will attempt to reach / capture this objective."

    };
    
    position  = 2;  // Position is taken into effect
    direction = 2;  // Direction is taken into effect
    optional  = 2;  // Synced entity is optional
    duplicate = 0;  // Multiple entities of this type can be synced

    synced[]  = {"AnyPerson", "GroupModifiers"};
};