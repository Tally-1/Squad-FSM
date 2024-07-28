class SQFM_huntKnowledge : Edit
{
    property     = "SQFM_Behaviour_huntKnowledge";
    displayName  = "Push Knowledge";
    tooltip      = "How much knowledge a group must have on a near enemy in order to push.";
    control      = "Slider";
    typeName     = "NUMBER";
    // defaultValue = "0.55";
    defaultValue = "missionNamespace getVariable ['SQFM_huntKnowledge', 0]";
};