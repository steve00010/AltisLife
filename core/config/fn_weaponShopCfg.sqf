#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",0],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
						["hgun_P07_snds_F","Stun Pistol",0],
						["16Rnd_9x21_Mag",nil,0],
						["ItemGPS",nil,0],
						["Binocular",nil,0],
						["NVGoggles_OPFOR",nil,2500],
						["ToolKit",nil,0],
						["Medikit",nil,0]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,0],
						["Binocular",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["NVGoggles",nil,2500]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at the required rank of Marshall!"};
			default
			{
				
				["Altis Marshall Shop",
					[
						["arifle_MXC_F",nil,5000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_NVS",nil,1000],
						["acc_flashlight",nil,0],
						["acc_pointer_IR",nil,0]
					]
				];
			};
		};
	};
	case "cop_corporal":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at the required rank of Corporal!"};
			default
			{
				
				["Altis Corporal Shop",
					[
						["arifle_MX_Black_F",nil,6000],
						["arifle_MXC_Black_F",nil,6000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_NVS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["SmokeShellBlue","Tear Gas Grenade",10000]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 4): {"You are not at the required rank of Sergeant!"};
			default
			{
				
				["Altis Sergeant Shop",
					[
						["arifle_MX_Black_F",nil,6000],
						["arifle_MXC_Black_F",nil,6000],
						["SMG_02_F",nil,10000],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_Arco",nil,1000],
						["optic_SOS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["SmokeShellBlue","Tear Gas Grenade",10000],
						["HandGrenade_Stone","Flashbang",10000]
					]
				];
			};
		};
	};
	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not at the required rank of Lieutenant!"};
			default
			{
				
				["Altis Lieutenant Shop",
					[
						["arifle_MXM_Black_F",nil,17500],
						["arifle_MX_Black_F",nil,6000],
						["arifle_MXC_Black_F",nil,6000],
						["SMG_02_F",nil,10000],
						["30Rnd_9x21_Mag",nil,200],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["srifle_LRR_SOS_F",nil,40000],
						["7Rnd_408_Mag",nil,0],
						["srifle_EBR_ARCO_pointer_F",nil,20000],
						["20Rnd_762x51_Mag",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_SOS",nil,1000],
						["optic_Arco",nil,1000],
						["optic_NVS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["SmokeShellBlue","Tear Gas Grenade",10000],
						["HandGrenade_Stone","Flashbang",10000]
					]
				];
			};
		};
	};

	case "cop_captain":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 6): {"You are not at the required rank of Captain!"};
			default
			{
				
				["Altis Captain Shop",
					[
						["arifle_MXM_Black_F",nil,17500],
						["arifle_MX_Black_F",nil,6000],
						["arifle_MXC_Black_F",nil,6000],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["srifle_LRR_SOS_F",nil,40000],
						["7Rnd_408_Mag",nil,0],
						["srifle_EBR_ARCO_pointer_F",nil,20000],
						["20Rnd_762x51_Mag",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_SOS",nil,1000],
						["optic_NVS",nil,1000],
						["optic_DMS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["muzzle_snds_H",nil,25000],
						["Rangefinder",nil,2000],
						["SmokeShellBlue","Tear Gas Grenade",10000],
						["HandGrenade_Stone","Flashbang",10000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a Rebel!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				
				["Mohammed's Jihadi Shop",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_Holo_F",nil,15000],
						["SMG_01_F",nil,25000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],	
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,75],					
						["30Rnd_65x39_caseless_mag",nil,300],
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,15000],
						["arifle_TRG21_ACO_pointer_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["7Rnd_408_Mag",nil,1000],
						["20Rnd_762x51_Mag",nil,1000],
						["NVGoggles",nil,2500],
						["NVGoggles_INDEP",nil,2500],
						["optic_MRCO",nil,3500],
						["optic_Hamr",nil,3500],
						["optic_Yorris",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_Aco_smg",nil,3500],
						["optic_NVS",nil,3500],
						["acc_flashlight",nil,1000]						
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_01_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["20Rnd_556x45_UW_mag",nil,125],
						["9Rnd_45ACP_Mag",nil,45],
						["11Rnd_45ACP_Mag",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (license_civ_rebel):
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_Holo_F",nil,15000],
						["SMG_01_F",nil,25000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],	
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,75],					
						["30Rnd_65x39_caseless_mag",nil,300],
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,15000],
						["arifle_TRG21_ACO_pointer_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["7Rnd_408_Mag",nil,1000],
						["20Rnd_762x51_Mag",nil,1000],
						["NVGoggles",nil,2500],
						["NVGoggles_INDEP",nil,2500],
						["optic_MRCO",nil,3500],
						["optic_Hamr",nil,3500],
						["optic_Yorris",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_Aco_smg",nil,3500],
						["optic_NVS",nil,3500],
						["acc_flashlight",nil,1000]	
					]
				];
			};
				
			default
			{
				
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_01_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["20Rnd_556x45_UW_mag",nil,125],
						["9Rnd_45ACP_Mag",nil,45],
						["11Rnd_45ACP_Mag",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "genstore":
	{
		
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2500]
			]
		];
	};
};


