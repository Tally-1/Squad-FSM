/*
    {Objective Marker options}

- Param: Visible for BLU,OPF,GRF
// - Param: Visible SL with Radio only
- Param  for no sat picture
- Param  for no visible intel

*/

#include "markerVisibilityCondition.cpp"
#include "markerVisibilitySides.cpp"

class showIntel : Checkbox
{
    property     = "SQFSM_Objective_showIntel";
    displayName  = "Show intel HUD";
    tooltip      = "Allows Intel HUD to show when the player moves his mouse over the objective marker.";
    defaultValue = "true";
};

class showSateliteImage : Checkbox
{
    property     = "SQFSM_Objective_showSateliteImage";
    displayName  = "Show Satelite Image";
    tooltip      = "When Intel HUD is open a satellite feed is shown.";
    defaultValue = "true";
};