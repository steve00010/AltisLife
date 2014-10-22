/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(life_action_inUse) exitWith {hint "An action is already being processed..."};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck","Air"],25];

if (playerSide != civilian) exitWith {hint "I got nothing to say to you. Leave me alone."};

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles == 0) exitWith {titleText["There are no vehicles nearby.","PLAIN"];};
if(!(createDialog "Life_Chop_Shop_v2")) exitWith {hint "There was a problem opening the chop shop menu."};

_control = ((findDisplay 5800) displayCtrl 5802);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_ind = [_className,(call life_garage_sell)] call TON_fnc_index;
		
		if(_ind != -1 && count crew _x == 0) then {
			_price = ((call life_garage_sell) select _ind) select 1;
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,_className];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
		};
	};
} foreach _nearVehicles;