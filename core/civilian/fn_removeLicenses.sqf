#include <macro.h>
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do {
	//Death while being wanted
	case 0: {
		SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("heroin","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("marijuana","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("coke","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("arc","civ"),false];
	};
	
	//Jail licenses
	case 1: {
		SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
		SVAR_MNS [LICENSE_VARNAME("arc","civ"),false];
	};
	
	//Remove motor vehicle licenses
	case 2: {
		if(GVAR_MNS LICENSE_VARNAME("driver","civ") OR GVAR_MNS LICENSE_VARNAME("air","civ") OR GVAR_MNS LICENSE_VARNAME("truck","civ") OR GVAR_MNS LICENSE_VARNAME("boat","civ")) then {			
			SVAR_MNS [LICENSE_VARNAME("air","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("driver","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("truck","civ"),false];
			SVAR_MNS [LICENSE_VARNAME("boat","civ"),false];
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3: {
		if(GVAR_MNS LICENSE_VARNAME("gun","civ")) then {
			SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	
	//Remove Rebel Licenses when joining ARC
	case 4;
	case 5:
	{
		if(license_civ_rebel) then 
		{
			license_civ_rebel = false;
			if (_state == 4) then
			{
				hint "You forfeit your Rebel license by joining A.R.C.";
			}
			else
			{
				hint "You have relinquished your Rebel license.";
			};
		};
	};
	
	//Remove ARC license when becoming Rebel
	case 6;
	case 7:
	{
		if(license_civ_arc) then //OR license_civ_packaging OR license_civ_export) then {
		{
			license_civ_arc = false;
			if (_state == 6) then
			{
				hint "Your A.R.C license has been revoked for joining the Rebels.";
			}
			else
			{
				hint "You have relinquished your A.R.C license.";
			};
		};
	};
};

player setVariable["IsRebel", license_civ_rebel,true];

[2] call SOCK_fnc_updatePartial;
