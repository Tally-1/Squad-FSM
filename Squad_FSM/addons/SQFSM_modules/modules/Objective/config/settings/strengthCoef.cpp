// const std::string tooltipLine1 = "The Amount of the selected Asset that will defend this point.";
// const std::string tooltipLine2 = "!Warning!";
// const std::string tooltipLine3 = "Remember to select the adequate amount in relation to the wanted asset type.";
// const std::string tooltipLine4 = "If not you may end up with 30 tanks guarding a FOB";

// // Join the tooltip string variables to create the tooltip key value
// const std::string tooltipKeyValue = tooltipLine1 + "\n" + tooltipLine2 + "\n" + tooltipLine3 + "\n" + tooltipLine4;

#define tip "Define the strength assigned to this objective.\nStrength Values:\nMAN = 1\nMRAP = 3\nAPC = 5\nTANK = 9\nA more Detailed description is found in the description at the bottom."

class capStrength: Edit
{
    
    property     = "SQFSM_Objective_assetCount";
    displayName  = "Capture Strength";
    tooltip      = tip;
    typeName     = "NUMBER";
    defaultValue = "8";
};
