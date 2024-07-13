class allowReconCapture : Checkbox
{
    property     = "SQFSM_allowReconCapture";
    displayName  = "Recon-squads";
    tooltip      = "Allows Recon-squads to capture this Objective.\nIf the Objective is a Recon Objective this will always be true, regardless of the setting here.";
    defaultValue = "false";
};

class allowInfantryCapture : Checkbox
{
    property     = "SQFSM_allowInfantryCapture";
    displayName  = "Infantry";
    tooltip      = "Allows Infantry & mixed squads to capture this Objective";
    defaultValue = "true";
};

class allowCarCapture : Checkbox
{
    property     = "SQFSM_allowCarCapture";
    displayName  = "Light Vehicles";
    tooltip      = "Allows Armed Cars & MRAPs to capture this Objective";
    defaultValue = "true";
};

class allowLightArmorCapture : Checkbox
{
    property     = "SQFSM_allowLightArmorCapture";
    displayName  = "Light Armor";
    tooltip      = "Allows APCs & Armored AA groups to capture this Objective";
    defaultValue = "true";
};

class allowHeavyArmorCapture : Checkbox
{
    property     = "SQFSM_allowHeavyArmorCapture";
    displayName  = "Heavy Armor";
    tooltip      = "Allows Heavy Armor groups to capture this Objective";
    defaultValue = "true";
};