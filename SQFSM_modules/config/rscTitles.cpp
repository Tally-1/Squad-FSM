class RscTitles
{
    class Default 
    {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };
    
    class SQFM_curatorHUD 
	{
		idd              = -1;
		name             = "SQFM_curatorHUD";
		movingEnable     = 0;
		enableSimulation = 1;
		enableDisplay    = 1;
		fadein           = 0;
		fadeout          = 0;
		duration         = 10000;
		onLoad           = "with uiNameSpace do { SQFM_curatorHUD = _this select 0 }";
		onUnLoad         = "with uiNameSpace do { SQFM_curatorHUD = displayNull }";

		class Controls{};
	};

	class SQFM_BattleHUD 
	{
		idd              = -1;
		name             = "SQFM_BattleHUD";
		movingEnable     = 0;
		enableSimulation = 1;
		enableDisplay    = 1;
		fadein           = 0;
		fadeout          = 0;
		duration         = 10000;
		onLoad           = "with uiNameSpace do { SQFM_BattleHUD = _this select 0 }";
		onUnLoad         = "with uiNameSpace do { SQFM_BattleHUD = displayNull }";

		class Controls{};
	};


	class SQFM_markerFeedBack 
	{
		idd              = -1;
		name             = "SQFM_markerFeedBack";
		movingEnable     = 0;
		enableSimulation = 1;
		enableDisplay    = 1;
		fadein           = 0;
		fadeout          = 0;
		duration         = 10;
		onLoad           = "with uiNameSpace do { SQFM_markerFeedBack = _this select 0 }";
		onUnLoad         = "with uiNameSpace do { SQFM_markerFeedBack = displayNull }";

		class Controls{};
	};

};