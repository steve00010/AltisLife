#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_MAIN_DISP 2203
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_PICTURE_CASH 1203
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_CASH_TEXT 1003
/*
	Name: Dillon "Itsyuka" Modine-Thuen
	File: ui.hpp
*/

class playerHUD {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		LIFE_UI_BACK,
		LIFE_BAR_FOOD,
		LIFE_BAR_WATER,
		LIFE_BAR_HEALTH,
		LIFE_PICTURE_FOOD,
		LIFE_PICTURE_WATER,
		LIFE_PICTURE_HEALTH,
		LIFE_PICTURE_CASH,
		LIFE_FOOD_TEXT,
		LIFE_WATER_TEXT,
		LIFE_HEALTH_TEXT,
		LIFE_CASH_TEXT
	};

	/* Background */
	class LIFE_UI_BACK: Life_RscBackground
	{
		idc = IDD_LIFE_MAIN_DISP;
		colorBackground[] = {0,0,0,0.0};
		x = 0.925 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.0825 * safezoneW;
		h = 0.15 * safezoneH;
	};

	/* Progress Bars */
	class LIFE_BAR_FOOD: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_FOOD;
		colorBackground[] = {0.153,0.682,0.376,1};
		x = 0.947 * safezoneW + safezoneX;
		y = 0.785 * safezoneH + safezoneY;
		w = 0.0515 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_WATER: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_WATER;
		colorBackground[] = {0.153,0.682,0.376,1};
		x = 0.947 * safezoneW + safezoneX;
		y = 0.82 * safezoneH + safezoneY;
		w = 0.0515 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_HEALTH: Life_RscProgress
	{
		idc = 2202;
		colorBackground[] = {0.753,0.224,0.169,1};
		x = 0.947 * safezoneW + safezoneX;
		y = 0.855 * safezoneH + safezoneY;
		w = 0.0515 * safezoneW;
		h = 0.022 * safezoneH;
	};

	/* Text */

	class LIFE_FOOD_TEXT: Life_RscText
	{
		idc = IDC_LIFE_FOOD_TEXT;
		text = "";
		x = 0.96 * safezoneW + safezoneX;
		y = 0.79 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_WATER_TEXT: Life_RscText
	{
		idc = IDC_LIFE_WATER_TEXT;
		text = "";
		x = 0.96 * safezoneW + safezoneX;
		y = 0.825 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_HEALTH_TEXT: Life_RscText
	{
		idc = IDC_LIFE_HEALTH_TEXT;
		text = "";
		x = 0.96 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_CASH_TEXT: Life_RscText
	{
		idc = IDC_LIFE_CASH_TEXT;
		colorText[] = {0.161,0.502,0.725,1};
		text = "";
		x = 0.944 * safezoneW + safezoneX;
		y = 0.895 * safezoneH + safezoneY;
		w = 0.06 * safezoneW;
		h = 0.015 * safezoneH;
	};
	
	
	/* Icons */
	class LIFE_PICTURE_FOOD: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_FOOD;
		text = "icons\food.paa";
		x = 0.92 * safezoneW + safezoneX;
		y = 0.777 * safezoneH + safezoneY;
		w = 0.06; h = 0.06;
	};
	class LIFE_PICTURE_WATER: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_WATER;
		text = "icons\water.paa";
		x = 0.92 * safezoneW + safezoneX;
		y = 0.813 * safezoneH + safezoneY;
		w = 0.06; h = 0.06;
	};
	class LIFE_PICTURE_HEALTH: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_HEALTH;
		text = "icons\health.paa";
		x = 0.922 * safezoneW + safezoneX;
		y = 0.853 * safezoneH + safezoneY;
		w = 0.05; h = 0.05;
	};
	class LIFE_PICTURE_CASH : life_RscPicture
	{
				
		idc = IDC_LIFE_PICTURE_CASH;
		text = "icons\money.paa";
		x = 0.9243 * safezoneW + safezoneX;
		y = 0.8915 * safezoneH + safezoneY;
		w = 0.05; h = 0.05;
	};
};