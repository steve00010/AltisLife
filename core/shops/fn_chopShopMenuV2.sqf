#include <macro.h>
/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Truck"],25];
if (playerSide != civilian) exitWith {hint "I got nothing to say to you. Leave me alone."};
life_chopShop = SEL(_this,3);
//Error check
if(EQUAL(count _nearVehicles,0)) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if(!(createDialog "Life_Chop_Shop_v2")) exitWith {hint localize "STR_Shop_ChopShopError"};

_control = CONTROL(5800,5802);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		
		_price = M_CONFIG(getNumber,CONFIG_VEHICLES,_className,"chopShop");
		if(!isNil "_price" && EQUAL(count crew _x,0)) then {
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;


