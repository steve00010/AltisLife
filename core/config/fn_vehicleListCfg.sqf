#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",3000],
			["C_Kart_01_Fuel_F",3000],
			["C_Kart_01_Red_F",3000],
			["C_Kart_01_Vrana_F",3000]
		];
	};

	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",5250],
			["C_SUV_01_F",11250]
		];
	};	
	
	case "med_air_hs": 
	{
	
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return = 
			[
				["B_Heli_Light_01_F",100000]
			];
				
			if(__GETC__(life_donator) > 2) then
			{		
				_return set[count _return,["O_Heli_Light_02_unarmed_F",200000]];
			};
		};
	};
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",6500],
			["C_Offroad_01_F",7500],
			["C_SUV_01_F",10000],
			["C_Van_01_transport_F",25000]
		];
		
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",30000]];
		};
	};
	
	case "kavala_car":
	{
		_return = 
		[
			["C_Hatchback_01_F",6500],
			["C_Offroad_01_F",7500],
			["C_SUV_01_F",10000]
		];
		
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",30000]];
		};
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",20000],
			["I_Truck_02_covered_F",225000],
			["I_Truck_02_transport_F",150000],
			["O_Truck_03_ammo_F",300000]
		];
		
		if(__GETC__(life_donator) > 0) then
		{
			_return set[count _return,["O_Truck_03_transport_F",300000]];
		};
			
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["O_Truck_03_covered_F",450000]];
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["B_Truck_01_transport_F",600000]];
		};
		
		if(__GETC__(life_donator) > 3) then
		{
			_return set[count _return,["B_Truck_01_covered_F",800000]];	
		};
		
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["O_Truck_03_device_F",1200000]];
		};
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",7500],
			["B_G_Offroad_01_armed_F",600000]
		];
	};
	
	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["B_Heli_Light_01_armed_F",400000],
			["O_Heli_Transport_04_bench_F",2500000]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["O_Heli_Light_02_F",600000]];
		};
		
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["B_Heli_Transport_01_camo_F",2000000]];
		};
		
	};
	
	case "reb_boat":
	{
		_return =
		[
			["I_SDV_01_F",30000],
			["O_G_Boat_Transport_01_F",15000]
		];
	};
	
	case "cop_car":
	{
		_return set[count _return,
			["C_Offroad_01_F",7000]];
		_return set[count _return,
			["C_Hatchback_01_F",6500]];
		_return set[count _return,
			["C_SUV_01_F",11000]];
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",175000]];
		};	
	};
	
	case "civ_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F",300000],
			["B_Heli_Light_01_F",300000],
			["I_Heli_Transport_02_F",2250000]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",2000000]];
		};
		
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return, ["B_Heli_Light_01_F",300000]];
			_return set[count _return, ["B_Heli_Transport_03_unarmed_F",2500000]];
		};
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",2000000]];
		};
		
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["I_Heli_light_03_F",2000000]];
		};	
		
	};
	
	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",300000]];
			_return set[count _return, ["B_Heli_Transport_03_unarmed_F",2500000]];
		};
		
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",2000000]];
		};
		
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["I_Heli_light_03_F",2000000]];
		};	
		
	}; 
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",15000],
			["C_Boat_Civil_01_police_F",40000],
			["B_SDV_01_F",25000]
		];
	};
};

_return;