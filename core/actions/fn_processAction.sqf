#include <macro.h>
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {["oil_unprocessed","oil_processed",200,"Processing Oil"];};
	case "diamond": {["diamond_uncut","diamond_cut",350,"Processing Diamond"]};
	case "copper": {["copper_unrefined","copper_refined",750,"Processing Copper"]};
	case "iron": {["iron_unrefined","iron_refined",120,"Processing Iron"]};
	case "sand": {["sand","glass",250,"Processing Sand"]};
	case "salt": {["salt_unrefined","salt_refined",250,"Processing Salt"]};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1200,"Making Cocaine"]};
	case "marijuana": {["cannabis","marijuana",700,"Drying and Bagging Marijuana"]};
	case "heroin": {["heroin_unprocessed","heroin_processed",1500,"Processing Heroin"]};
	case "cement": {["rock","cement",350,"Mixing Cement"]};
	case "crystal": {["crystal_unrefined","crystal_refined",100,"Processing Crystal"]};
	case "silver": {["silver_unrefined","silver_refined",100,"Processing Silver"]};	
	case "mash": {["water","mash",100,"Mixing Grain Mash",true,"cornmeal"]};//new
	case "whiskey": {["yeast","whiskey",300,"Fermenting Whiskey",true,"rye"]};//new
	case "beer": {["yeast","beerp",250,"Brewing Beer",true,"hops"]};//new
	case "moonshine": {["yeast","moonshine",550,"Moonshining",true,"mash"]};//new
	case "bottledshine": {["moonshine","bottledshine",700,"Bootle Moonshine",true,"bottles"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bottle Beer",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Bottle Whiskey",true,"bottles"]};//new
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then {
	while{true} do {
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,localize _itemName],"PLAIN"];
	life_is_processing = false;
} else {
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	SUB(CASH,_cost);
	life_is_processing = false;
};