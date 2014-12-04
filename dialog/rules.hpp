class Life_server_rules {
	idd = 2300;
	name= "life_server_rules";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.05;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.05 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class MainBackground2:Life_RscStructuredText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2303;
			x = 0.1;
			y = 0.68 + (8 / 250);
			w = 0.8;
			h = 0.65 - (22 / 250);
		};
		
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2301;
			text = "Server Rules";
			x = 0.1;
			y = 0.05;
			w = 0.8;
			h = (1 / 25);
		};
		
		class Rules : Life_RscStructuredText
		{
			idc = 2302;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
				
			x = 0.12; y = 0.11;
			w = 0.76; h = 0.4;
		};
		
		

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Decline";
			colorBackground[] = {0.812,0.047,0.047,1};
			onButtonClick = "['end1,true,2'] call BIS_fnc_endMission;(findDisplay 2300) displayRemoveEventHandler ['KeyDown', noesckey]; closeDialog 0;";
			x = -0.058 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};		
	
		class RepaintCar : life_RscButtonMenu {
			idc = -1;
			text = "Accept";
			colorBackground[] = {0.024,0.69,0.133,1};
			onButtonClick = "[] call life_fnc_hudSetup;(findDisplay 2300) displayRemoveEventHandler ['KeyDown', noesckey]; closeDialog 0;";
			x = 0.585 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};