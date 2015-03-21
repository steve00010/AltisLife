class DAP_BF_UI 
{
	idd=51000;
  	movingEnable=0;
  	duration=900000;
  	fadein=1;
  	name="SCORES";
	OnLoad = "HUDDisplay = _this";
	controlsBackground[] = {};
  	controls[] = {"TimeCounterLabel", "TimeCounterValue"};
	
	class TimeCounterLabel: HUDTEXT
	{
		idc = 51001;
		text = "$STR_DAP_TIMER_CAPTION_NAME";
		x = safezoneX+0.45;
		y = safezoneY+0.0015;
		h = 0.045621;

	};
	class TimeCounterValue: HUDTEXT
	{
		idc = 51002;
		text = "";
		x = safezoneX+0.63;
		y = safezoneY+0.0015;
		h = 0.045621;
	};
};