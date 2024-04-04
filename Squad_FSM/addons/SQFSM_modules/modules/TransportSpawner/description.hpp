// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
class ModuleDescription : ModuleDescription
{
    description[] = {
    "Transport spawner",
    "When an AI squad calls for transport this module will spawn in a vehicle with a driver.",
    "Sync this module to the vehicle types you wish to spawn as transport.",
    "If no vehicles are synced then a Zamak(16 seats) will be used as a default transport.",
    "Only Land vehicles are valid (No helis)",
    "If multiple vehicle types are synced, the one with the closest amount of seats to the amount needed is selected.",
    "If the squadsize is larger than the available transport capacity then the request will be denied.",
    "The module will attempt to spawn new transport vehicles in the same dir and pos as the synced vehicles.",
    "The synced vehicles will be deleted on start once the data is registered"
    };
    
    position  = 1;  // Position is taken into effect
    direction = 0;  // Direction is taken into effect
    optional  = 0;  // Synced entity is optional
    duplicate = 1;  // Multiple entities of this type can be synced

    synced[]  = {"AnyPerson", "GroupModifiers"};
};