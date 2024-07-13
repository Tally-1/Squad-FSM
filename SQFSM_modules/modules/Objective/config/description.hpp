// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
class ModuleDescription : ModuleDescription
{
    description[] = {
    "Objective module.",
    "Squads will attempt to reach / capture this objective.",
    "The squads will be assigned according to the strength defined above.",
    "The strength is calculated as follows:",
    "Man  = 1 point",
    "MRAP = 3 points",
    "APC  = 5 points",
    "Tank = 9 points",
    "",
    "A 8 man infantry squad equals 8 points.",
    "A Tank section with 2 Main Battle Tanks equals 18 points",
    "A 4 man squad with an Armed MRAP equals 5 points (Driver and Gunner is excluded)"
    };
    
    position  = 2;  // Position is taken into effect
    direction = 2;  // Direction is taken into effect
    optional  = 2;  // Synced entity is optional
    duplicate = 0;  // Multiple entities of this type can be synced

    synced[]  = {"AnyPerson", "GroupModifiers"};
};