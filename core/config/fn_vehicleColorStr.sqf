/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Channel7"};
			case 2: {_color = "Cop"};
			case 3: {_color = "EMS"};
		};
	};
	
	case "O_Heli_Light_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Camo"};

		};
	};
	
	case "B_Heli_Light_01_armed_F":
		{
		switch (_index) do
		{
			case 0: {_color = "Camo"};

		};
	};
	
	case "I_Heli_light_03_F":
		{
		switch (_index) do
		{
			case 0: {_color = "Cop"};

		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Cop"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Green"};
			case 1: {_color = "Cop"};
			case 2: {_color = "WRC"};
			case 3: {_color = "RedBull"};
			case 4: {_color = "Dayz"};
		};
	};
	
	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Black"};
			case 7: {_color = "Cop"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "EMS"};
			case 10: {_color = "Dodge"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Green";};
			case 1: {_color = "Blue";};
			case 2: {_color = "Yellow";};
			case 3: {_color = "Grey"};
			case 4: {_color = "Black"};
			case 5: {_color = "Cop"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red"};
			case 1: {_color = "Black"};
			case 2: {_color = "Silver"};
			case 3: {_color = "Orange"};
			case 4: {_color = "Carbon"};
			case 5: {_color = "Cop"};
			case 6: {_color = "EMS"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Digi Green"};
			case 2: {_color = "Blue"};
			case 3: {_color = "Red"};
			case 4: {_color = "Blueline"};
			case 5: {_color = "Elliptical"};
			case 6: {_color = "Furious"};
			case 7: {_color = "Jeans Blue"};
			case 8: {_color = "Speedy Redline"};
			case 9: {_color = "Sunset"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Waves Blue"};
			case 12: {_color = "EMS"};
			case 13: {_color = "Cop"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	
	case "C_Boat_Civil_01_police_F":
	{	
		switch (_index) do
		{
			case 0: {_color = "Cop"};
		};
	};
};

_color;