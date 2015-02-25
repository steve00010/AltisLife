#include <macro.h>
/*
	File: fn_chopShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private["_control","_selection","_vehicle","_colorIndex","_price"];

if((lbCurSel 2302) == -1) exitWith {hint "You did not pick a vehicle!"};
_className = lbData[2302,(lbCurSel 2302)];
_colorIndex = lbValue[2304,(lbCurSel 2304)];


_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,__className,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),4)};
};

if (CASH < _price) exitWith { hint "You do not have the cash required!"};


_nearVehicles = nearestObjects[getPos (player),["Car","Air","Truck"],25]; //Fetch vehicles within 30m.
if(count _nearVehicles > 0) then
	{
		{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((getPlayerUID player) == _vehOwner) exitWith
			{
				if((_x getVariable "dbInfo") select 1 == lbValue[2302,(lbCurSel 2302)]) then {
					_vehicle = _x;
				} else {
					_colorIndex = _x getVariable "OColor";
					[_x,_colorIndex] spawn life_fnc_colorVehicle;
				};
			};
		};
	} foreach _nearVehicles;
};

_colorIndex = lbValue[2304,(lbCurSel 2304)];
[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;
SUB(CASH,_price);
_plate = (_vehicle getVariable "dbInfo") select 1;
_vehicle setVariable["OColor",_colorIndex];
[[getPlayerUID player,_plate,_colorIndex,_vehicle],"TON_fnc_vehicleSpray",false,false] spawn life_fnc_MP;
closeDialog 0;