#include <macro.h>
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type"];
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if(player distance _fish > 3.5) exitWith {};
switch(true) do {
	case ((typeOf _fish) == "salemaRaw"): {_type = "salema_raw"};
	case ((typeOf _fish) == "ornateRaw") : {_type = "ornate_raw"};
	case ((typeOf _fish) == "mackeralRaw") : {_type = "mackerel_raw"};
	case ((typeOf _fish) == "tunaRaw") : {_type = "tuna_raw"};
	case ((typeOf _fish) == "mulletRaw") : {_type = "mullet_raw"};
	case ((typeOf _fish) == "catsharkRaw") : {_type = "catshark_raw"};
	default {_type = ""};
};

if(EQUAL(_type,"")) exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then {
	deleteVehicle _fish;
	titleText[format[(localize "STR_NOTF_Fishing"),_type],"PLAIN"];
};