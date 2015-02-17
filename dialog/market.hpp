class Market
{
	idd = 39000;
	name = "Market";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.7;
			h = 0.7;
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 39001;
			text = "Economy Prices!";
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
		
		
		class RscTrunkText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Buying Price";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.25;
			w = 0.33; h = 0.04;
		};
		
		class RscPlayerText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Selling Price";
			sizeEx = 0.04;
			
			x = 0.45; y = 0.25;
			w = 0.33; h = 0.04;
		};	
	};
	
	class Controls
	{
		class achatGear : Life_RscListBox
		{
			idc = 39002;
			text = "";
			sizeEx = 0.030;
			
			x = 0.11; y = 0.29;
			w = 0.33; h = 0.65;
		};
		
		class VenteGear : Life_RscListBox
		{
			idc = 39003;
			text = "";
			sizeEx = 0.030;
			
			x = 0.45; y = 0.29;
			w = 0.33; h = 0.65;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.948 ;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};