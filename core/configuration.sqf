#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_god = false;
life_frozen = false; 
life_markers = false;
life_drug_level = 0;
life_used_drug = [0,0,0];
life_drug_withdrawl = false;
life_addiction = [0,0,0];
life_cocaine_effect = false;
life_fatigue = 0.5; //Set the max fatigue limit (50%)
life_request_timer = false;
life_drink = 0;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,3000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,1000000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
pbh_life_cash = 0;
__CONST__(life_impound_car,500);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,1000);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		pbh_life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 400; //Paycheck Amount
	};
	case civilian: 
	{
		pbh_life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
	
	case independent: {
		pbh_life_atmcash = 500000;
		life_paycheck = 600;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	"life_inv_kidney",
	"life_inv_surgeryknife",
	"life_inv_zipties",
	"life_inv_scratchcard",
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_moonshine",
	"life_inv_mash"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"]

];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = 
[
	["heroinu",1200],
	["heroinp",2500],
	["cocaine",1500],
	["cocainep",3500],
	["marijuana",2000],
	["turtle",3000],
	["blastingcharge",6000],
	["kidney",5000],
	["goldbar",8000],
	["goldbarp",8000],
	["surgeryknife",8000],
	["zipties",100],
	["boltcutter",500],
	["underwatercharge",6000],
	["lockpick",200],
	["moonshine",9000],
	["bottledshine",11000]

];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",6000],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",68],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",125000],
	["goldbarp",95000],
	["kidney",50000],
	["surgeryknife",25000],
	["zipties",200],
	["scratchcard",2500],
	["bottledshine",15000], 
	["bottledwhiskey",11000], 
	["bottledbeer",10000], 
	["moonshine",7000], 
	["whiskey",5000], 
	["beerp",4500], 
	["mash",2500], 
	["rye",2000], 
	["hops",1800], 
	["yeast",2000], 
	["cornmeal",200], 
	["bottles",75]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",50],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["underwatercharge",40000],
	["kidney",75000],
	["surgeryknife",35000],
	["zipties",100],
	["scratchcard",5000],
	["bottledshine",12500], 
	["bottledwhiskey",8000], 
	["bottledbeer",8000], 
	["moonshine",7500], 
	["whiskey",5500], 
	["beerp",5000], 
	["cornmeal",500], 
	["mash",2500], 
	["bottles",100]
	
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_MX_Black_F",nil,6000],
	["arifle_MXC_Black_F",nil,6000],
	["SMG_02_F",nil,10000],
	["30Rnd_9x21_Mag",nil,20],
	["srifle_LRR_SOS_F",nil,40000],
	["7Rnd_408_Mag",nil,0],
	["srifle_EBR_ARCO_pointer_F",nil,20000],
	["20Rnd_762x51_Mag",nil,0],
	["30Rnd_65x39_caseless_mag",nil,0],
	["30Rnd_65x39_caseless_mag_Tracer",nil,0],
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["ItemRadio",500],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["ItemCompass",nil,500],
	["ItemWatch",nil,500],
	["ItemMap",nil,250],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Holosight",nil,1000],
	["optic_SOS",nil,1000],
	["optic_NVS",nil,1000],
	["optic_DMS",nil,1000],
	["optic_Arco",850],
	["optic_Holosight_smg",nil,1000],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["B_IR_Grenade",nil,1000],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["acc_flashlight",nil,0],
	["acc_pointer_IR",nil,0],
	["30Rnd_9x21_Mag",30],
	["SmokeShellBlue","Tear Gas Grenade",10000],
	["HandGrenade_Stone","Flashbang",10000]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",100],
	["C_Kart_01_Blu_F",300],
	["C_Kart_01_Fuel_F",300],
	["C_Kart_01_Red_F",300],
	["C_Kart_01_Vrana_F",300],
	["C_Hatchback_01_F",400],
	["C_Offroad_01_F", 600],
	["B_G_Offroad_01_F",800],
	["C_SUV_01_F",1400],
	["C_Van_01_transport_F",2000],
	["C_Hatchback_01_sport_F",600],
	["C_Van_01_fuel_F",1100],
	["I_Heli_Transport_02_F",30000],
	["I_Heli_light_03_F",75000],
	["C_Van_01_box_F",2300],
	["I_Truck_02_transport_F",3000],
	["I_Truck_02_covered_F",3500],
	["B_Truck_01_transport_F",6500],
	["B_Truck_01_box_F", 8000],
	["O_MRAP_02_F",7500],
	["B_Heli_Light_01_F",12000],
	["C_Heli_Light_01_civil_F",12000],
	["B_Heli_Light_01_armed_F",14000],
	["O_Heli_Light_02_unarmed_F",16000],
	["O_Heli_Light_02_F",18000],
	["B_Heli_Transport_01_F",25000],
	["B_Heli_Transport_01_camo_F",25000],
	["B_Heli_Transport_03_unarmed_F",45000],
	["O_Heli_Transport_04_bench_F",45000],
	["C_Rubberboat",100],
	["C_Boat_Civil_01_F",1100],
	["B_Boat_Transport_01_F",150],
	["C_Boat_Civil_01_police_F",1000],
	["B_Boat_Armed_01_minigun_F",4000],
	["B_SDV_01_F",6000],
	["B_MRAP_01_F",7500],
	["O_Truck_02_transport_F",5000],
	["O_Truck_02_covered_F",6000],
	["O_Truck_03_transport_F",8000],
	["O_Truck_03_covered_F",10000],
	["O_Truck_03_device_F",15000],
	["O_Truck_03_device_F",25000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["C_Kart_01_Blu_F",2250],
	["C_Kart_01_Fuel_F",2250],
	["C_Kart_01_Red_F",2250],
	["C_Kart_01_Vrana_F",2250],
	["B_Quadbike_01_F",1875],
	["C_Hatchback_01_F",4125],
	["C_Offroad_01_F", 5625],
	["B_G_Offroad_01_F",5625],
	["B_G_Offroad_01_armed_F",200000],
	["C_SUV_01_F",11250],
	["C_Van_01_transport_F",18750],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",1312500],
	["C_Van_01_box_F",22500],
	["I_Truck_02_transport_F",45000],
	["I_Truck_02_covered_F",60000],
	["B_Truck_01_transport_F",225000],
	["B_Truck_01_covered_F", 337500],
	["B_Truck_01_box_F", 450000],
	["O_Truck_03_device_F", 675000],
	["B_MRAP_01_F",125000],
	["O_MRAP_02_F",150000],
	["I_MRAP_03_F",155000],
	["B_Heli_Light_01_F",125000],
	["B_Heli_Light_01_armed_F",175000],
	["O_Heli_Light_02_unarmed_F",175000],
	["O_Heli_Light_02_F",175000],
	["B_Heli_Transport_01_F",750000],
	["C_Heli_Light_01_civil_F",175000],
	["B_Heli_Transport_01_camo_F",750000],
	["B_Heli_Transport_03_unarmed_F",900000],
	["O_Heli_Transport_04_bench_F",900000],
	["I_Heli_light_03_unarmed_F",750000],
	["I_Heli_light_03_F",750000],
	["C_Rubberboat",3750],
	["C_Boat_Civil_01_F",9000],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",26250],
	["O_Truck_02_covered_F",150000],
	["O_Truck_02_transport_F",200000],
	["O_Truck_03_transport_F",300000],
	["O_Truck_03_covered_F",450000],
	["O_Truck_03_device_F",500000]
];
__CONST__(life_garage_sell,life_garage_sell);

life_garage_chop =
[
	["C_Kart_01_Blu_F",2250],
	["C_Kart_01_Fuel_F",2250],
	["C_Kart_01_Red_F",2250],
	["C_Kart_01_Vrana_F",2250],
	["B_Quadbike_01_F",1875],
	["C_Hatchback_01_F",4125],
	["C_Offroad_01_F", 5625],
	["B_G_Offroad_01_F",5625],
	["B_G_Offroad_01_armed_F",600000],
	["C_SUV_01_F",11250],
	["C_Van_01_transport_F",10750],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",1312500],
	["C_Van_01_box_F",22500],
	["I_Truck_02_transport_F",45000],
	["I_Truck_02_covered_F",60000],
	["B_Truck_01_transport_F",225000],
	["B_Truck_01_covered_F", 337500],
	["B_Truck_01_box_F", 450000],
	["O_Truck_03_device_F", 675000],
	["B_MRAP_01_F",175000],
	["O_MRAP_02_F",225000],
	["I_MRAP_03_F",200000],
	["B_Heli_Light_01_F",90000],
	["C_Heli_Light_01_civil_F",90000],
	["B_Heli_Light_01_armed_F",200000],
	["O_Heli_Light_02_unarmed_F",300000],
	["B_Heli_Transport_01_F",750000],
	["B_Heli_Transport_01_camo_F",750000],
	["I_Heli_light_03_unarmed_F",750000],
	["B_Heli_Transport_03_unarmed_F",900000],
	["O_Heli_Transport_04_bench_F",900000],
	["C_Rubberboat",3750],
	["C_Boat_Civil_01_F",9000],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",20250],
	["O_Truck_02_covered_F",90000],
	["O_Truck_02_transport_F",100000],
	["O_Truck_03_transport_F",150000],
	["O_Truck_03_covered_F",250000],
	["O_Truck_03_device_F",750000]
];
__CONST__(life_garage_chop,life_garage_chop);