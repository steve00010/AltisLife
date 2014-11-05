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
		license_civ_rebel = false;
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_rebel = false;
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
	
	//Remove Rebel Licenses when joining corp
	case 4;
	case 5:
	{
		if(license_civ_rebel OR license_civ_heroin OR license_civ_marijuana OR license_civ_coke) then 
		{
			license_civ_rebel = false;
			license_civ_meth = false;
			if (_state == 4) then
			{
				license_civ_heroin = false;
				license_civ_marijuana = false;
				license_civ_coke = false;
			}
			else
			{
				hint "You have relinquished your Rebel licenses.";
			};
		};
	};
};

player setVariable["IsRebel", license_civ_rebel,true];