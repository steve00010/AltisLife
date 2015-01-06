/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,-1,[0]] call BIS_fnc_param;

diag_log format["Remove license - %1", _state];

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_stiller = false;
		//license_civ_driver = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			hint "You have lost all your motor vehicle licenses for vehicular manslaughter.";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			hint "You have lost your firearms license for manslaughter.";
		};
	};
	
	// Revoking Licenses
	
	// Marijuana License
	case 10:
	{
		license_civ_marijuana = false;
		hint localize "STR_Civ_RevokeLicense_Marijuana";
	};
	// Truck License
	case 11:
	{
		license_civ_heroin = false;
		hint localize "STR_Civ_RevokeLicense_Heroin";
	};
	// Pilot License
	case 12:
	{
		license_civ_coke = false;
		hint localize "STR_Civ_RevokeLicense_Coke";
	};
	// Boating License
	case 13:
	{
		license_civ_air = false;
		hint localize "STR_Civ_RevokeLicense_Air";
	};
	// Diving License
	case 14:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Driving";
	};
	// Rebel License
	case 15:
	{
		license_civ_rebel = false;
		hint localize "STR_Civ_RevokeLicense_Rebel";
	};
	// All Motor Vehicle
	case 16:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_dive = false;
		license_civ_taxi = false;
		hint localize "STR_Civ_RevokeLicense_AllMotor";
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
};

player setVariable["IsRebel", license_civ_rebel,true];