#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"

/*
	Master settings for various features and functionality	
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 3000; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 3; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 1000000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.0; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes
	
	/* Impound Variables */
	impound_car = 500; //Price for impounding cars
	impound_boat = 250; //Price for impounding boats
	impound_air = 1000; //Price for impounding helicopters / planes

	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "B_G_Offroad_01_armed_F" };

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	crimes[] = { 
		{"STR_Crime_1","350","1"}, 			//Driving Without Lights
		{"STR_Crime_2","1000","2"}, 		//Driving Without License
		{"STR_Crime_3","1000","3"}, 		//Driving Over The Speed Limit
		{"STR_Crime_4","500","4"}, 			//Reckless Driving
		{"STR_Crime_5","20000","5"},		//Driving Stolen Vehicle
		{"STR_Crime_6","5000","6"}, 		//Hit and Run
		{"STR_Crime_7","10000","7"}, 		//Attempted Murder
		{"STR_Crime_187V","7500","8"},		//Vehicular Manslaughter
		{"STR_Crime_187","25000","9"},		//Manslaughter
		{"STR_Crime_901","15000","10"},		//Escaping Jail
		{"STR_Crime_215","5000","11"},		//Attempted Auto Theft
		{"STR_Crime_213","10000","12"},		//Use of Illegal Explosives
		{"STR_Crime_211","10000","13"},		//Robbery
		{"STR_Crime_207","5000","14"},		//Kidnapping
		{"STR_Crime_207A","2500","15"},		//Attempted Kidnapping
		{"STR_Crime_390","1000","16"},		//Public intoxication
		{"STR_Crime_487","7500","17"},		//Grand Theft
		{"STR_Crime_488","1000","18"},		//Petty Theft
		{"STR_Crime_480","1500","19"},		//Hit and Run
		{"STR_Crime_481","4000","20"},		//Drug Possession
		{"STR_Crime_482","2500","21"},		//Intent to Distribute
		{"STR_Crime_483","6000","22"},		//Drug Trafficking
		{"STR_Crime_459","10000","23"},		//Burglary
		{"STR_Crime_666","1500","24"},		//Tax Evasion
		{"STR_Crime_667","10000","25"},		//Terrorism
		{"STR_Crime_668","3000","26"},		//Unlicensed Hunting
		{"STR_Crime_919","10000","27"},		//Organ Theft
		{"STR_Crime_919A","5000","28"}
	};
	
	sellArray[] = {
	{"srifle_EBR_F",10000},
	{"srifle_GM6_F",10000},
	{"hgun_P07_F",500},
	{"hgun_Rook40_F",500},
	{"hgun_PDW2000_F",500},
	{"arifle_Katiba_F",1000},
	{"arifle_Katiba_GL_F",1000},
	{"arifle_MXC_F",1000},
	{"arifle_MX_F",1000},
	{"arifle_MX_GL_F",1000},
	{"arifle_MX_SW_F",1000},
	{"arifle_MXM_F",1000},
	{"arifle_SDAR_F",1000},
	{"arifle_TRG21_F",1000},
	{"arifle_TRG20_F",1000},
	{"arifle_TRG21_GL_F",1000},
	{"LMG_Zafir_F",1000},
	{"hgun_ACPC2_F",100},
	{"SMG_01_F",1000},
	{"SMG_02_F",1000},
	{"srifle_DMR_01_F",1000},
	{"hgun_Pistol_heavy_01_F",500},
	{"hgun_Pistol_heavy_01_MRD_F",500},
	{"hgun_Pistol_heavy_02_F",500},
	{"arifle_MXC_Black_F",1000},
	{"arifle_MX_Black_F",1000},
	{"arifle_MX_GL_Black_F",1000},
	{"arifle_MX_SW_Black_F",1000},
	{"arifle_MXM_Black_F",1000},
	{"hgun_Pistol_Signal_F",150},
	//Items
	{"ItemWatch",45},
	{"ItemCompass",45},
	{"ItemGPS",45},
	{"ItemRadio",45},
	{"ItemMap",45},
	{"MineDetector",450},
	{"Binocular",45},
	{"Rangefinder",45},
	{"NVGoggles",45},
	{"NVGoggles_OPFOR",45},
	{"NVGoggles_INDEP",45},
	{"FirstAidKit",45},
	{"Medikit",45},
	{"ToolKit",45},
	{"Laserdesignator",45},
	{"B_UavTerminal",450},
	{"O_UavTerminal",450},
	{"I_UavTerminal",450},
	{"muzzle_snds_H",400},
	{"muzzle_snds_L",400},
	{"muzzle_snds_M",400},
	{"muzzle_snds_B",400},
	{"muzzle_snds_H_MG",400},
	{"optic_Arco",500},
	{"optic_Hamr",500},
	{"optic_Aco",500},
	{"optic_ACO_grn",500},
	{"optic_Aco_smg",500},
	{"optic_ACO_grn_smg",500},
	{"optic_Holosight",500},
	{"optic_Holosight_smg",500},
	{"optic_SOS",500},
	{"optic_MRCO",1000},
	{"muzzle_snds_acp",1000},
	{"optic_DMS",500},
	{"optic_Yorris",500},
	{"optic_MRD",500},
	{"optic_LRPS",500},
	{"optic_NVS",500},
	{"Laserbatteries",100},
	{"acc_flashlight",100},
	{"acc_pointer_IR",100},
	//Magazines
	{"30Rnd_556x45_Stanag",10},
	{"30Rnd_556x45_Stanag_Tracer_Red",10},
	{"30Rnd_556x45_Stanag_Tracer_Green",10},
	{"30Rnd_556x45_Stanag_Tracer_Yellow",10},
	{"20Rnd_556x45_UW_mag",10},
	{"30Rnd_65x39_caseless_mag",10},
	{"30Rnd_65x39_caseless_green",10},
	{"30Rnd_65x39_caseless_mag_Tracer",10},
	{"30Rnd_65x39_caseless_green_mag_Tracer",10},
	{"20Rnd_762x51_Mag",10},
	{"7Rnd_408_Mag",10},
	{"5Rnd_127x108_Mag",10},
	{"30Rnd_9x21_Mag",10},
	{"16Rnd_9x21_Mag",10},
	{"9Rnd_45ACP_Mag",10},
	{"30Rnd_45ACP_Mag_SMG_01",10},
	{"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",10},
	{"11Rnd_45ACP_Mag",10},
	{"6Rnd_45ACP_Cylinder",10},
	{"10Rnd_762x51_Mag",10},
	{"5Rnd_127x108_APDS_Mag",10},
	{"6Rnd_GreenSignal_F",10},
	{"6Rnd_RedSignal_F",10},
	{"B_IR_Grenade",100},
	{"O_IR_Grenade",100},
	{"I_IR_Grenade",100},
	{"1Rnd_Smoke_Grenade_shell",10},
	{"1Rnd_SmokeRed_Grenade_shell",10},
	{"1Rnd_SmokeGreen_Grenade_shell",10},
	{"1Rnd_SmokeYellow_Grenade_shell",10},
	{"1Rnd_SmokePurple_Grenade_shell",10},											
	{"1Rnd_SmokeBlue_Grenade_shell",10},
	{"1Rnd_SmokeOrange_Grenade_shell",10},
	{"SmokeShellBlue","Tear Gas Grenade",1000},
	{"HandGrenade_Stone","Flashbang",1000}
	};

	allowedSavedVirtualItems[] = { "pickaxe","fuelEmpty","fuelFull","spikeStrip","lockpick","defuseKit","storageSmall",
	"storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donut","rabbitGrilled","salemaGrilled","ornateGrilled",
	"mackerelGrilled","tunaGrilled","mulletGrilled","catsharkGrilled","turtleSoup","henGrilled",
	"roosterGrilled","sheepGrilled","goatGrilled","underwatercharge","kidney","surgeryknife","zipties",
	"scratchcard","bottledshine","bottledwhiskey","bottledbeer","moonshine","whiskey","beerp","cornmeal",
	"mash","bottles","monster","hen_raw","rabbit_raw","salema_raw","ornate_raw","mackerel_raw",
	"tuna_raw","mullet_raw","catshark_raw","turtle_raw","rooster_raw","sheep_raw","goat_raw","scratchcard",
	"oil_processed","copper_refined","iron_refined","salt_refined","diamond_cut","cement","monster"};
};

//Virtual Items
class VirtualItems {
	//Added
	VITEMMACRO(kidney, "STR_Item_kidney", "Kidney", 15, 40000, 35000, false, -1, "icons\kidney.paa")
	VITEMMACRO(surgeryknife, "STR_Item_SurgeryKnife", "surgeryknife", 2, 25000, 27000, false, -1, "icons\surgeryknife.paa")
	VITEMMACRO(zipties, "STR_Item_Zipties", "zipties", 1, 500, 20, true, -1, "icons\zipties.paa")
	VITEMMACRO(scratchcard, "STR_Item_ScratchCard", "scratchcard", 1, 500, 20, true, -1, "icons\scratchcard.paa")
	VITEMMACRO(cornmeal, "STR_Item_Cornmeal", "cornmeal", 2, 100, 80,false, -1, "icons\cornmeal.paa")
	VITEMMACRO(beerp, "STR_Item_Beerp", "beerp", 3, -1, 1000, false, -1, "icons\beerp.paa")
	VITEMMACRO(whiskey, "STR_Item_Whiskey", "whiskey", 3, -1, 1500, false, -1, "icons\whiskey.paa")
	VITEMMACRO(rye, "STR_Item_Rye", "rye", 2, 50, 100, false, -1, "icons\rye.paa")
	VITEMMACRO(hops, "STR_Item_Hops", "hops", 2, 50, 100, false, -1, "icons\hops.paa")
	VITEMMACRO(yeast, "STR_Item_Yeast", "yeast", 2, 50, 100, false, -1, "icons\yeast.paa")
	VITEMMACRO(bottles, "STR_Item_Bottles", "bottles", 4, 100, 50, false, -1, "icons\bottles.paa")
	VITEMMACRO(bottledshine, "STR_Item_Bottleshine", "bottledshine", 5, 2000, 3000, true, 5, "icons\bottledshine.paa")
	VITEMMACRO(bottledbeer, "STR_Item_Bottledbeer", "bottledbeer", 5, 2500, 3500, false, 5, "icons\bottledbeer.paa")
	VITEMMACRO(bottledwhiskey, "STR_Item_BottledWhiskey", "bottledwhiskey", 5, 3500, 4500, true, 5, "icons\bottledwhiskey.paa") 
	VITEMMACRO(moonshine, "STR_Item_Moonshine", "moonshine", 3, 4000, 5000, true, 3, "icons\moonshine.paa")
	VITEMMACRO(mash, "STR_Item_Mash", "mash", 2, 10, 10, false, 1, "icons\mash.paa")
	VITEMMACRO(goldbarp, "STR_Item_GoldBarp", "goldBarp", 12, -1, 85000, false, -1, "icons\goldbarp.paa")
	VITEMMACRO(underwatercharge, "STR_Item_BChargewater", "underwatercharge", 15, 35000, -1, true, -1, "icons\underwatercharge.paa")
	
	//Misc
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "icons\pickaxe.paa")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 850, 500, false, -1, "icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "icons\spikestrip.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 150, 75, false, -1, "icons\lockpick.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 95000, false, -1, "icons\goldbar.paa")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "icons\blastingcharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "icons\boltcutter.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "icons\storagesmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "icons\storagebig.paa")

	//Mined Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 7, -1, -1, false, -1, "icons\oil_unprocessed.paa")
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 6, -1, 3200, false, -1, "icons\oil_processed.paa")
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 4, -1, -1, false, -1, "icons\copper_ore.paa")
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 3, -1, 1500, false, -1, "icons\copper.paa")
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "icons\iron_ore.paa")
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 3, -1, 3200, false, -1, "icons\iron.paa")
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "icons\salt_unprocessed.paa")
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 1450, false, -1, "icons\salt.paa")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "icons\sand.paa")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1450, false, -1, "icons\glass.paa")
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "icons\diamond_unprocessed.paa")
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 2000, false, -1, "icons\diamond.paa")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "icons\rock.paa")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 1950, false, -1, "icons\cement.paa")

	//Drugs
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 6, -1, -1, true, -1, "icons\heroin_unprocessed.paa")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 4, -1, 2560, true, -1, "icons\heroin.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "icons\cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, 2800, 2350, true, -1, "icons\marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, 3000, true, -1, "icons\cocaine_unprocessed.paa")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 4, -1, 5000, true, -1, "icons\cocaine.paa")

	//Drink
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "icons\redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\coffee.paa")
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "icons\water.paa")
	VITEMMACRO(monster, "STR_Item_Monster", "monster", 1, 1500, 200, false, 100, "icons\monster.paa")
	

	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "icons\apple.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "icons\peach.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa")
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "icons\donut.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbitRaw", 2, -1, 65, false, -1, "icons\meat.paa")
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbitGrilled", 1, 150, 115, false, 20, "icons\ico_cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_Salema", "salemaRaw", 2, -1, 45, false, -1, "icons\fish.paa")
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salemaGrilled", 1, 75, 55, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "icons\fish.paa")
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornateGrilled", 1, 175, 150, false, 25, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 175, false, -1, "icons\fish.paa")
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerelGrilled", 2, 250, 200, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 700, false, -1, "icons\fish.paa")
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tunaGrilled", 3, 1250, 1000, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "icons\fish.paa")
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mulletFried", 2, 600, 400, false, 80, "icons\ico_cookedMeat.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 300, false, -1, "icons\fish.paa")
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catsharkFried", 3, 750, 500, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, 4000, 3000, true, -1, "icons\turtle.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 2500, 1000, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 35, false, -1, "icons\meat.paa")
	VITEMMACRO(hen_fried, "STR_Item_HenFried", "henFried", 1, 115, 85, false, 65, "icons\ico_cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 35, false, -1, "icons\meat.paa")
	VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "roosterGrilled", 115, 85, false, 45, "icons\ico_cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 50, false, -1, "icons\meat.paa")
	VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheepGrilled", 2, 155, 115, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 75, false, -1, "icons\meat.paa")
	VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goatGrilled", 2, 175, 135, false, 100, "icons\ico_cookedMeat.paa")
};


/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",500,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",1000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",25000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",10000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",10000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(cg,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",25000,true,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",19500,true,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",15000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",75000,true,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",35000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",12000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",30000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",14500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",9500,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",75000,false,"civ")
	LICENSEMACRO(stiller,"STR_License_Stiller","stiller",75000,false,"civ")
	LICENSEMACRO(liquor,"STR_License_Liquor","liquor",75000,false,"civ")
	LICENSEMACRO(bottler,"STR_License_Bottler","bottler",75000,false,"civ")
	LICENSEMACRO(channelseven,"STR_License_ChannelSeven","channelseven7",0,false,"civ")
	
};

class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "storagesmall", "storagebig", "scratchcard", "monster","zipties", "bottles","cornmeal" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "scratchcard","zipties","underwatercharge", "bottles", "cornmeal" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "scratchcard","zipties", "monster" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donuts" };
	};
	
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "marijuana" };
	};
	class bar {
		name="STR_Shops_Bar";
		items[] = {"bottledbeer","bottledwhiskey","bottledshine","moonshine","redgull"};
	};
	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_refined", "copper_refined" };
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cop {
		name = "STR_Shops_Cop";
		items[] = { "donut", "coffee", "spikeStrip", "waterBottle", "rabbit_grilled", "apple", "redgull", "fuelFull", "defusekit" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar","goldbarp" };
	};
	class organ {
		name = "STR_Shops_Organ";
		items[]  = {"kidney","surgeryknife"};
	}
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"
