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
			case 2: {_color = "Proph"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Cop"};
			case 5: {_color = "EMS"};
			case 6: {_color = "Channel 7"};
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
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Black"};
			case 7: {_color = "Cop"};
			case 8: {_color = "WRC"};
			case 9: {_color = "RedBull"};
			case 10: {_color = "Dayz"};
			case 11: {_color = "Dragon"};
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
			case 10: {_color = "Monster"};
			case 11: {_color = "Captain"};
			case 12: {_color = "Drug"};
			case 13: {_color = "DEA" };
			case 14: {_color = "SWAT" };


		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
			case 8: {_color = "Cop"};
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
			case 7: {_color = "Ferrari"};
			case 8: {_color = "Flames"};
			case 9: {_color = "Camo"};
			case 10: {_color = "Taxi"};
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
			case 0: {_color = "Digi Desert"};
			case 1: {_color = "Black"};
			case 2: {_color = "Blue"};
			case 3: {_color = "Red"};
			case 4: {_color = "White"};
			case 5: {_color = "Digi Green"};
			case 6: {_color = "Hunter Camo"};
			case 7: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Civ Blue"};
			case 2: {_color = "Civ Red"};
			case 3: {_color = "Digi Green"};
			case 4: {_color = "Blueline"};
			case 5: {_color = "Elliptical"};
			case 6: {_color = "Furious"};
			case 7: {_color = "Jeans Blue"};
			case 8: {_color = "Speedy Redline"};
			case 9: {_color = "Sunset"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Waves Blue"};
			case 12: {_color = "Rebel Digital"};
			case 13: {_color = "Graywatcher"};
			case 14: {_color = "Light"};
			case 15: {_color = "Shadow"};
			case 16: {_color = "Sheriff"};
			case 17: {_color = "Wasp"};
			case 18: {_color = "Oliv"};
			case 19: {_color = "EMS"};
			case 20: {_color = "Cop"};
			case 21: {_color = "MSI"};
		};
	};
	
	case "C_Heli_Light_01_civil_F": //Hummingbird M900
	{
		switch (_index) do
		{
			case 0: {_color = "Blueline"};
			case 1: {_color = "Digi Green"};
			case 2: {_color = "Elliptical"};						
			case 3: {_color = "Furious"};
			case 4: {_color = "Graywatcher"};
			case 5: {_color = "Jeans Blue"};
			case 6: {_color = "Light"};
			case 7: {_color = "Shadow"};
			case 8: {_color = "Sheriff"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Wasp"};
			case 13: {_color = "Waves Blue"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
			case 1: {_color = "Reb"};
			case 2: {_color = "DEA"}; 
			case 3: {_color = "Swat"}; 
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