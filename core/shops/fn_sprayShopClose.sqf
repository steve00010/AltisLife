#include <macro.h>
/*
	File: fn_chopShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private["_className","_colorIndex","_vehicle"];

//Error checks

_className = lbData[2302,(lbCurSel 2302)];

_nearVehicles = nearestObjects[getPos (player),["Car","Air","Truck"],30]; //Fetch vehicles within 30m.
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
				[_x,_x getVariable "OColor"] spawn life_fnc_colorVehicle;
			};
		};
	} foreach _nearVehicles; 
};

closeDialog 0;