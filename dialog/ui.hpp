	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class foodHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\food.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.575;
				//w = 0.03; h = 0.04; old value
				w = 0.05; h = 0.06; //width and height of the icon
			};
			
			class waterHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\water.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.510;
				//w = 0.04; h = 0.04; 
				w = 0.05; h = 0.06; 
			};
			
			class healthHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\health.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.445;
				//w = 0.02; h = 0.03;
				w = 0.05; h = 0.06;
			};
			class geldIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\money.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.380;
				//w = 0.03; h = 0.03;
				w = 0.05; h = 0.05;
			};
			class fpsIcon : life_RscPicture
			{
				
				idc = -1;
				text = "icons\fps.paa";
				x = safeZoneX+safeZoneW-0.09; y = safeZoneY+safeZoneH-0.315;
				w = 0.09; h = 0.05;
			};
		};
		
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]= { 0, 0, 0, 0.5 };
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]= { 0, 0, 0, 0.5 };
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]= { 0, 0, 0, 0.5 };
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			class geldtext
			{
				type=0;
				idc=23520;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]= { 0, 0, 0, 0.5 };
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";			
			};
			class fpstext
			{
				type=0;
				idc=23525;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";			
			};
		};   
 	}; 