class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Backg : Life_RscPicture
		{
			idc = -1;
			text = "images\spawn_bg.jpg";
			x = 0.0 * safezoneW + safezoneX;
			y = 0.0 * safezoneH + safezoneY;
			w = 1.0 * safezoneW;
			h = 1.0 * safezoneH;
		};
		class backgroundpic: Life_RscPicture
		{
			idc = -1;
			text = "images\spawn_bg1.jpg";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.6;
		};
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.1; y = 0.14;
			w = 0.92; h = (1 / 25);
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
			x = 0.3625; 
			y = 0.14;
			w = 0.55; 
			h = 0.04;
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.328; 
			y = 0.2;
			w = 0.571;
			h = 0.6;
			maxSatelliteAlpha = 0.7 5;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			colorBackground[] = {0,0,0,0.7};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.105; y = 0.26;
			w = (8.8 / 40);
			h = (10 / 25);
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0,0,0,1};
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.11; y = 0.69;
			w = (8 / 40);
			h = (1 / 25);
		};
	};
};