#include <macro.h>
/*
	File: fn_clothing_cop.sqf
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
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack ["U_B_Wetsuit",nil,0];
			_ret pushBack ["U_Rangemaster","Marshall Uniform",5000];
		};
		
		if(__GETC__(life_coplevel) > 2) then //corporal
		{
			_ret pushBack ["U_B_HeliPilotCoveralls","Pilot Uniform",10000];
		};
		
		if(__GETC__(life_coplevel) > 3) then //sergeant
		{
			_ret pushBack ["U_B_CombatUniform_mcam_worn","Senior Uniform",10000];
		};
		if(__GETC__(life_coplevel) > 4) then //Lieutenant
		{
			_ret pushBack ["U_B_GhillieSuit","Ghillie Suit",15000];
		};
		
		if(__GETC__(life_swatlevel) > 0) then
		{
			_ret set[count _ret,["U_B_CTRG_1","SWAT Uniform",12500]];			
		};
		
		if(__GETC__(life_coplevel) > 1) then
		{
		    _ret set[count _ret,["U_B_CTRG_3","DEA Uniform",12500]];
		};	
		
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then //officer above
		{
			_ret pushBack ["H_Cap_police","Cap",0];
		};
		
		if(__GETC__(life_coplevel) > 2) then //corporal above
		{
			_ret pushBack ["H_Cap_blk","Black","Cap",0];

			_ret pushBack ["H_PilotHelmetHeli_B","Pilot Helm",0];
		};
		if(__GETC__(life_coplevel) > 3) then //Sergeant
		{
			_ret pushBack ["H_CrewHelmetHeli_B","Gas Mask",15000];
			_ret pushBack ["H_Beret_blk_POLICE","Police beret",0];
			
		};
		if(__GETC__(life_coplevel) > 4)then //Lieutenant
		{
			_ret pushBack ["H_Watchcap_blk","Police beanie",0];
			
		};
		
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Aviator",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Diving",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_RebreatherB","Re-breather",0];
		_ret pushBack ["V_TacVest_blk_POLICE","Tac Police Vest",10000];

		if(__GETC__(life_coplevel) > 2) then //Corporal
		{
			_ret pushBack ["V_PlateCarrier1_blk","PlateCarrier",10000];

		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Bergen_sgg","Bergen",5000],
			["B_Carryall_cbr","Carryall",0]
		];
	};
};

_ret;
