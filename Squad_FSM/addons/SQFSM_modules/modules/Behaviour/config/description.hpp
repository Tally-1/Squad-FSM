// Module description (must inherit from base class, otherwise pre-defined entities won't be available):
class ModuleDescription : ModuleDescription
{
    description[] = {
    "Defines custom squad behaviour:",
    "",
    "STANDARD SQUADS: ",
    "    - Will attack Objectives if allowed and available.",
    "    - Will defend Objectives if allowed and available.",
    "    - Will respond to reinforcement calls if allowed and available.",
    "",
    "SUPPORT SQUADS: ",
    "    - Only implemented for artillery & mortar groups. (May be expanded later)",
    "    - Will respond to calls for indirect fire.",
    "    - If a ''non-arty'' group is set as support it will be changed to standard.",
    "",
    "RECON SQUADS:",
    "    - Will move to Recon objectives and Observation Posts.",
    "    - Shares intel with their own side.",
    "    - Has priority for CAS and Artillery support.",
    "    - Will avoid direct contact with enemy.",
    "    - Will attempt to keep as stealthy as possible."

    };
    
    position  = 2;  // Position is taken into effect
    direction = 2;  // Direction is taken into effect
    optional  = 2;  // Synced entity is optional
    duplicate = 0;  // Multiple entities of this type can be synced

    synced[]  = {"AnyPerson", "GroupModifiers"};
};