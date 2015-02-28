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
						["Medikit",nil,0],
						["ItemRadio","SmartPhone",500],
						["ItemCompass",nil,500],
						["ItemWatch",nil,500],
						["ItemMap",nil,250]
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
						["NVGoggles",nil,2500],
						["ItemRadio","SmartPhone",500]
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
			case (FETCH_CONST(life_coplevel) < 2): {"You are not a Marshall!"};
			default
			{
				
				["Altis Marshall Shop",
					[
						["arifle_MXC_F",nil,5000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_NVS",nil,1000],
						["acc_flashlight",nil,0],
						["acc_pointer_IR",nil,0],
						["ItemRadio","SmartPhone",500]
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
			case (FETCH_CONST(life_coplevel) < 3): {"You are not a Corporal!"};
			default
			{
				
				["Altis Corporal Shop",
					[
						["arifle_MX_Black_F",nil,3000],
						["arifle_MXC_Black_F",nil,3000],
						["16Rnd_9x21_Mag",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Aco",nil,1000],
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
			case (FETCH_CONST(life_coplevel) < 4): {"You are not a Sergeant!"};
			default
			{
				
				["Altis Sergeant Shop",
					[
						["arifle_MX_Black_F",nil,3000],
						["arifle_MXC_Black_F",nil,3000],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Aco",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_Arco",nil,1000],
						["optic_SOS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["SmokeShellBlue","Tear Gas Grenade",10000]
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
			case (FETCH_CONST(life_coplevel) < 5): {"You are not a Lieutenant!"};
			default
			{
				
				["Altis Lieutenant Shop",
					[
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,3000],
						["arifle_MXC_Black_F",nil,3000],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["optic_ACO_grn","Aco Green",1000],
						["optic_Aco","Aco Red",1000],
						["optic_Holosight","Holosight",1000],
						["optic_MRCO",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_SOS",nil,1000],
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
	
	case "cop_swat":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (FETCH_CONST(life_swatlevel) < 1): {"You are not a member of the Swat team!"};
			case (FETCH_CONST(life_swatlevel) == 2):
			{
				
				["Altis Swat Shop",
					[
						["30Rnd_65x39_caseless_mag",nil,0],
						["srifle_LRR_SOS_F",nil,10000],
						["arifle_Katiba_GL_F","Riot Control",40000],
						["7Rnd_408_Mag",nil,0],
						["srifle_EBR_ARCO_pointer_F",nil,10000],
						["20Rnd_762x51_Mag",nil,0],
						["optic_ACO_grn","Aco Green",1000],
						["optic_Aco","Aco Red",1000],
						["optic_Holosight","Holosight",1000],
						["optic_MRCO","MRCO",1000],
						["optic_Holosight_smg","SMG",1000],
						["optic_SOS","SOS",1000],
						["optic_Arco","Arco",1000],
						["optic_NVS","NVoptic",1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["B_IR_Grenade",nil,1000],
						["Rangefinder",nil,2000],
						["muzzle_snds_H","6.5 Suppressor",1000],
						["muzzle_snds_B","7.62 Suppressor",1000],
						["SmokeShellBlue","Tear Gas Grenade",10000],
						["1Rnd_SmokeBlue_Grenade_shell","Riot Control Grenade",10000],
						["HandGrenade_Stone","Flashbang",10000]
					]
				];
			};
			default
			{
				
				["Altis Swat Shop",
					[
						["30Rnd_65x39_caseless_mag",nil,0],
						["7Rnd_408_Mag",nil,0],
						["srifle_EBR_ARCO_pointer_F",nil,10000],
						["20Rnd_762x51_Mag",nil,0],
						["optic_ACO_grn","Aco Green",1000],
						["optic_Aco","Aco Red",1000],
						["optic_Holosight","Holosight",1000],
						["optic_MRCO","MRCO",1000],
						["optic_Holosight_smg","SMG",1000],
						["optic_SOS","SOS",1000],
						["optic_Arco","Arco",1000],
						["optic_NVS","NVoptic",1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["B_IR_Grenade",nil,1000],
						["Rangefinder",nil,2000],
						["muzzle_snds_H","6.5 Suppressor",1000],
						["muzzle_snds_B","7.62 Suppressor",1000],
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
			case (FETCH_CONST(life_coplevel) < 6): {"You are not a Captain!"};
			default
			{
				
				["Altis Captain Shop",
					[
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,3000],
						["arifle_MXC_Black_F",nil,3000],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["optic_ACO_grn",nil,1000],
						["optic_Aco",nil,1000],
						["optic_Holosight",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_Holosight_smg",nil,1000],
						["optic_SOS",nil,1000],
						["optic_NVS",nil,1000],
						["optic_DMS",nil,1000],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["B_IR_Grenade",nil,1000],
						["muzzle_snds_H","Silencer6.5mm",10000],
						["SmokeShellBlue","Tear Gas Grenade",10000]
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
			case (!license_civ_rebel): {"You don't have a Rebel license!"};
			default
			{
				
				["Mohammed's Jihadi Shop",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_ACPC2_F",nil,750],
						["hgun_PDW2000_Holo_F",nil,7000],
						["SMG_01_F",nil,15000],
						["16Rnd_9x21_Mag",nil,20],
						["30Rnd_9x21_Mag","SMG Rounds",30],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],	
						["hgun_Pistol_heavy_02_F",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,100],
						["11Rnd_45ACP_Mag",nil,75],					
						["30Rnd_65x39_caseless_mag",nil,300],
						["arifle_TRG20_F",nil,10000],
						["arifle_Mk20_F",nil,10000],
						["arifle_Katiba_F",nil,20000],
						["srifle_DMR_01_ACO_F",nil,35000],
						["10Rnd_762x51_Mag",nil,400],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["7Rnd_408_Mag",nil,1000],
						["20Rnd_762x51_Mag",nil,1000],
						["NVGoggles",nil,2500],
						["NVGoggles_INDEP",nil,2500],
						["optic_MRCO",nil,3500],
						["optic_DMS",nil,3500],
						["optic_Hamr",nil,3500],
						["optic_Yorris",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_Aco_smg",nil,3500],
						["optic_NVS",nil,3500],
						["acc_flashlight",nil,1000],
						["ItemRadio","SmartPhone",500]						
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
			case (!license_civ_gun): {"HAHA, get a license if you want to fire a Gun!"};
			default
			{
				
				["Billy Joe's Firearms",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2500],
						["ItemRadio","SmartPhone",500],
						["ItemCompass",nil,500],
						["ItemWatch",nil,500],
						["ItemMap",nil,250],
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_01_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["30Rnd_9x21_Mag","SMG Rounds",0],
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
						["hgun_PDW2000_Holo_F",nil,7500],
						["SMG_01_F",nil,10000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],	
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,75],					
						["30Rnd_65x39_caseless_mag",nil,300],
						["arifle_TRG20_F",nil,10000],
						["arifle_Mk20_F",nil,10000],
						["arifle_TRG21_ACO_pointer_F",nil,10000],
						["arifle_Katiba_F",nil,20000],
						["arifle_MXC_F",nil,20000],
						["srifle_DMR_01_ACO_F",nil,25000],
						["10Rnd_762x51_Mag",nil,400],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
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
						["optic_LRPS",nil,3500],
						["optic_Aco_smg",nil,3500],
						["optic_NVS",nil,3500],
						["Rangefinder",nil,5000],
						["acc_flashlight",nil,1000],
						["B_IR_Grenade",nil,1500],
						["FirstAidKit",nil,250],
						["ItemRadio","SmartPhone",500]
					]
				];
			};
				
			default
			{
				
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_01_F",nil,5050],
						["hgun_ACPC2_F",nil,7500],
						["hgun_PDW2000_F",nil,12000],
						["arifle_SDAR_F",nil,10000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["20Rnd_556x45_UW_mag",nil,125],
						["9Rnd_45ACP_Mag",nil,45],
						["11Rnd_45ACP_Mag",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["ItemRadio","SmartPhone",500]
					]
				];
			};
		};
	};
	
	case "arc":
	{
		switch(true) do
		{
			case (playerSide != east): {"You are not ARC!"};
			default
			{
				
				["ARC Weapons",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2500],
						["ItemRadio","SmartPhone",500],
						["ItemCompass",nil,500],
						["ItemWatch",nil,500],
						["ItemMap",nil,250],
						["arifle_TRG21_ACO_pointer_F",nil,10000],
						["hgun_Pistol_Signal_F",nil,2500],						
						["hgun_Pistol_heavy_02_F",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,100],
						["6Rnd_GreenSignal_F",nil,50],
						["6Rnd_RedSignal_F",nil,50],						
						["SMG_02_ACO_F",nil,5000],
						["30Rnd_9x21_Mag",nil,300],					
						["30Rnd_556x45_Stanag",nil,300],
						["optic_MRCO",nil,3500],
						["optic_DMS",nil,3500],
						["optic_Hamr",nil,3500],
						["optic_Yorris",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_Aco_smg",nil,3500],
						["optic_NVS",nil,3500]						
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
				["NVGoggles",nil,2500],
				["ItemRadio","SmartPhone",500],
				["ItemCompass",nil,500],
				["ItemWatch",nil,500],
				["ItemMap",nil,250]
			]
		];
	};
};


