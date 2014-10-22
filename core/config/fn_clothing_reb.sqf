/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_O_SpecopsUniform_ocamo","SpecOP",10000],
			["U_O_CombatUniform_oucamo","Combat",10000],
			["U_O_PilotCoveralls","Pilot",10000],
			["U_O_OfficerUniform_ocamo","Officer",10000],
			["U_O_GhillieSuit","Ghillie",40000],
			["U_O_Wetsuit","Wetsuit",10000],
			["U_IG_Guerilla1_1","Guerilla",0]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Shemag_olive","Shemag Olive",850],
			["H_Shemag_khk","Shemag Kahki",800],
			["H_HelmetO_ocamo","Combat Helmet",2500],
			["H_HelmetLeaderO_ocamo","Helmet Officer",2500],
			["H_MilCap_oucamo","Military Cap",800],
			["H_Bandanna_camo","Bandanna",650],
			["H_CrewHelmetHeli_O","Crew Helmet",2500]
			
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Diving",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk","TacVest",12500],
			["V_BandollierB_cbr","Bandoleer",4500],
			["V_HarnessO_brn","Harness",7500],
			["V_RebreatherIA","Re-breather",7500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr","Assault",2500],
			["B_TacticalPack_oli","Tactical",3500],
			["B_FieldPack_ocamo","Field",3000],
			["B_Kitbag_cbr","Kitbag",4500],
			["B_Carryall_oli","Carryall Olive",5000],
			["B_Carryall_khk","Carryall Kahki",5000]
		];
	};
};