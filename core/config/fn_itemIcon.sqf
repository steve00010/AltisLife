/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	default {("icons\items\empty.paa")};
	//Virtual Inventory Items
	case "life_inv_oilu": {("icons\oil_unprocessed.paa")};
	case "life_inv_oilp": {("icons\oil_processed.paa")};
	case "life_inv_heroinu": {("icons\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("icons\heroin_processed.paa")};
	case "life_inv_cannabis": {("icons\cannabis.paa")};
	case "life_inv_marijuana": {("icons\marijuana.paa")};
	case "life_inv_apple": {("icons\apple.paa")};
	case "life_inv_rabbit": {("icons\meat.paa")};
	case "life_inv_salema": {("icons\fish.paa")};
	case "life_inv_ornate": {("icons\fish.paa")};
	case "life_inv_mackerel": {("icons\fish.paa")};
	case "life_inv_tuna": {("icons\fish.paa")};
	case "life_inv_mullet": {("icons\fish.paa")};
	case "life_inv_catshark": {("icons\fish.paa")};
	case "life_inv_turtle": {("icons\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\fishingpoles.paa")};
	case "life_inv_water": {("icons\water.paa")};
	case "life_inv_coffee": {("icons\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\donut.paa")};
	case "life_inv_fuelE": {("icons\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\fuel_can.paa")};
	case "life_inv_pickaxe": {("icons\pickaxe.paa")};
	case "life_inv_copperore": {("icons\copper_ore.paa")};
	case "life_inv_ironore": {("icons\iron_ore.paa")};
	case "life_inv_ironr": {("icons\iron.paa")};
	case "life_inv_copperr": {("icons\copper.paa")};
	case "life_inv_sand": {("icons\sand.paa")};
	case "life_inv_salt": {("icons\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\salt.paa")};
	case "life_inv_glass": {("icons\glass.paa")};
	case "life_inv_diamond": {("icons\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("icons\diamond.paa")};
	case "life_inv_tbacon": {("icons\meat.paa")};
	case "life_inv_redgull": {("icons\redgull.paa")};
	case "life_inv_lockpick": {("icons\lockpick.paa")};
	case "life_inv_peach": {("icons\peach.paa")};
	case "life_inv_coke": {("icons\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("icons\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("icons\spikestrip.paa")};
	case "life_inv_rock": {("icons\rock.paa")};
	case "life_inv_cement": {("icons\cement.paa")};
	case "life_inv_goldbar": {("icons\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\storagesmall.paa")};
	case "life_inv_storagebig": {("icons\storagebig.paa")};
	case "life_inv_goldbarp": {("icons\goldbarp.paa")};
	case "life_inv_underwatercharge": {("icons\underwatercharge.paa")};
	case "life_inv_kidney": {("icons\kidney.paa")};
	case "life_inv_zipties": {("icons\zipties.paa")};
	case "life_inv_bottles": {("icons\bottles.paa")};
	case "life_inv_monster": {("icons\monster.paa")};
	case "life_inv_bottledbeer": {("icons\bottledbeer.paa")};
	case "life_inv_bottledshine": {("icons\bottledshine.paa")};
	case "life_inv_surgeryknife": {("icons\surgeryknife.paa")};
	case "life_inv_bottledwhiskey": {("icons\bottledwhiskey.paa")};
	case "life_inv_moonshine": {("icons\moonshine.paa")};
	case "life_inv_rye": {("icons\rye.paa")};
	case "life_inv_hops": {("icons\hops.paa")};
	case "life_inv_yeast": {("icons\yeast.paa")};
	case "life_inv_mash": {("icons\mash.paa")};
	case "life_inv_scratchcard": {("icons\scratchcard.paa")};
	case "life_inv_cornmeal": {("icons\cornmeal.paa")};
	case "life_inv_surgeryknife": {("icons\surgeryknife.paa")};
	
};