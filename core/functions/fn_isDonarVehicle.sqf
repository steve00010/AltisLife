/*
	File: fn_isDonarVehicle.sqf
	Author: Paul "Jerico" Smith
	
	Description:
	Determines if Vehicle is Donar
*/
private["_return","_vehicle"];
_vehicle = _this select 0;

// Check if vehicle is null
if(isNull _vehicle) exitWith {};

_return = false;

switch (typeof _vehicle) do
{
	case "B_Truck_01_transport_F";
	case "B_Truck_01_covered_F";
	case "B_Truck_01_box_F";
	case "O_Truck_03_device_F";
	case "C_Hatchback_01_sport_F";
	case "B_Heli_Transport_01_F": { _return = true };
};

_return;