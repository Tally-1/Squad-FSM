class assetType : Combo
{
    property     = "SQFSM_Objective_assetType";      // Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
    displayName  = "Asset Type";
    tooltip      = "Select the asset type that will prioritize this objective.";
    typeName     = "STRING";
    defaultValue = """infantry""";
    
    // Listbox items:
    class Values
    {
        class infantry
        {
            name  = "Infantry";
            value = "infantry";
        };

        class cars
        {
            name  = "Light Vehicles";
            value = "cars";
        };

        class armor_l
        {
            name  = "Light Armor";
            value = "armor_l";
        };

		class armor_h
        {
            name  = "Heavy Armor";
            value = "armor_h";
        };
    };
};