#include <macro.h>
/*
	File: fn_clothing_swat.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Namew
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{

		if(__GETC__(life_swatlevel) > 0) then
		{
			_ret pushBack ["U_B_CTRG_1","SWAT Uniform",2500];		
		};
		
	};
	
	//Hats
	case 1:
	{
		
	};
	
	//Glasses
	case 2:
	{

	};
	
	//Vest
	case 3:
	{

	};
	
	//Backpacks
	case 4:
	{

	};
};

_ret;
