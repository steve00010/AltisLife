#include <macro.h>
/*
	File: fn_chopShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private["_className","_colorIndex","_vehicle"];

if((lbCurSel 2302) == -1) exitWith {hint "You did not pick a vehicle!"};
//Error checks
if(isNull _control OR _selection == -1) exitWith {};
_className = lbData[2302,(lbCurSel 2302)];
_colorIndex = lbValue[2304,(lbCurSel 2304)];

_nearVehicles = nearestObjects[getPos (player),["Car","Air","Truck"],25]; //Fetch vehicles within 30m.
if(count _nearVehicles > 0) then
	{
		{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((_x getVariable "dbInfo") select 1 == lbValue[2302,(lbCurSel 2302)]) exitWith
			{
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;
};
_colorIndex = lbValue[2304,(lbCurSel 2304)];
[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;
