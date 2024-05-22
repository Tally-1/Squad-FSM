class squadType : Combo
{
    
    property     = "SQFSM_squadType"; 
    displayName  = "Squad Type";
    tooltip      = "Select Squad type. Will affect the squad behaviour.\nRead the description at the bottom.\n";
    typeName     = "STRING";
    defaultValue = """standard""";
    
    // Listbox items:
    class Values
    {
        class standard
        {
            name  = "Standard";
            value = "standard";
        };

        class isRecon
        {
            name  = "Recon";
            value = "recon";
        };

        class isSupport
        {
            name  = "Support";
            value = "support";
        };
    };
};