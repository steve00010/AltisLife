/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {80};
	case "B_G_Offroad_01_F": {80};
	case "B_Quadbike_01_F": {20};
	case "I_Truck_02_covered_F": {350}; // Zamak Covered
	case "I_Truck_02_transport_F": {300}; // Zamak
	case "I_Truck_02_Box_F": {450}; // Zamak Box
	case "C_Hatchback_01_F": {60};
	case "C_Hatchback_01_sport_F": {75};
	case "C_SUV_01_F": {80};
	case "C_Van_01_transport_F": {180};
	case "I_G_Van_01_transport_F": {180};
	case "C_Van_01_box_F": {200};
	case "C_Boat_Civil_01_F": {200};
	case "C_Boat_Civil_01_police_F": {100};
	case "C_Boat_Civil_01_rescue_F": {200};
	case "B_Truck_01_transport_F": {650};
	case "B_Truck_01_covered_F": {800};
	case "B_Truck_01_box_F": {900};
	case "B_MRAP_01_F": {100};
	case "O_MRAP_02_F": {150};
	case "I_MRAP_03_F": {60};
	case "B_Heli_Light_01_F": {40};
	case "O_Heli_Light_02_unarmed_F": {90};
	case "I_Heli_Transport_02_F": {100};
	case "C_Rubberboat": {85};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {85};
	case "B_Boat_Transport_01_F": {85};
	//New Below
	case "O_Truck_02_covered_F": {375};
	case "O_Truck_02_transport_F": {300};
	case "O_Truck_03_transport_F": {450};
	case "O_Truck_03_covered_F": {500};
	case "O_Truck_03_ammo_F": {400};
	case "B_Truck_01_mover_F": {20};//Towtruck keep low
	case "O_Truck_03_device_F": {600};
	case "O_Heli_Light_02_unarmed_F": {60};
	case "O_Heli_Light_02_F": {60};
	case "B_Heli_Transport_01_F": {100};
	case "B_Heli_Transport_01_camo_F": {120}; // Ghosthawk
	case "Land_CargoBox_V1_F": {3000};
	case "B_SDV_01_F": {150};
	case "I_SDV_01_F": {150};
	case "B_Heli_Light_01_armed_F": {20};
	case "B_Heli_Transport_03_unarmed_F": {140}; //new chopper
	case "O_Heli_Transport_04_bench_F": {140};//new chopper
	case "C_Heli_Light_01_civil_F": {20}; // new chopper
	case "B_G_Offroad_01_armed_F": {75};
	case "I_Heli_light_03_F": {20}; // Hellcat
	case "Box_IND_Grenades_F": {350}; // Small Supply Crate
	case "B_supplyCrate_F": {700}; // Large Supply Crate
	case "O_G_Boat_Transport_01_F": {100}; //Reb Boat
	case "B_Truck_01_mover_F": {100}; //Hemmt Mover
	default {-1};
};