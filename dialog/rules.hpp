class Life_server_rules {
	idd = 2300;
	name= "life_server_rules";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		
		class MainBackground2:Life_RscStructuredText {
			colorBackground[] = {0, 0, 0, 1};
			idc = 2303;
			x = 0.1;
			y = 0.68 + (8 / 250);
			w = 0.8;
			h = 0.65 - (22 / 250);
		};
		class Hiding:Life_RscStructuredText {
			colorBackground[] = {0,0,0,1};
			idc = 2303;
			x = 0.1;
			y = 0.5 - (1 / 25);
			w = 0.8;
			h = 0.1;
		};
	};
	
	class controls {

	
		
		class Rules : Life_RscStructuredText
		{
			idc = 2302;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
				
			x = 0.12;
			y = -0.3;
			w = 0.78;
			h = 0.8;
		};
		
		

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Decline";
			colorBackground[] = {0.812,0.047,0.047,0.7};
			onButtonClick = "['end1,true,2'] call BIS_fnc_endMission;(findDisplay 2300) displayRemoveEventHandler ['KeyDown', noesckey]; closeDialog 0;";
			x = -0.058 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};		
	
		class AcceptRulesButton : life_RscButtonMenu {
			idc = -1;
			text = "Accept";
			colorBackground[] = {0.153,0.682,0.376,0.7};
			onButtonClick = "[] call life_fnc_hudSetup;(findDisplay 2300) displayRemoveEventHandler ['KeyDown', noesckey]; closeDialog 0;";
			x = 0.585 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};