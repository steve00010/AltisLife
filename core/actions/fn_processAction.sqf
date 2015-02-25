#include <macro.h>
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_error1","_error2","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_oldVal2","_2var"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oil_unprocessed","oil_processed",1200,"Processing Oil"];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,"Processing Diamond"]};
	case "copper": {["copper_unrefined","copper_refined",750,"Processing Copper"]};
	case "iron": {["iron_unrefined","iron_refined",1120,"Processing Iron"]};
	case "sand": {["sand","glass",650,"Processing Sand"]};
	case "salt": {["salt_unrefined","salt_refined",450,"Processing Salt"]};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,"Making Cocaine"]};
	case "marijuana": {["cannabis","marijuana",500,"Drying and Bagging Marijuana"]};
	case "heroin": {["heroin_unprocessed","heroin_processed",1720,"Processing Heroin"]};
	case "cement": {["rock","cement",350,"Mixing Cement"]};
	case "mash": {["water","mash",100,"Mixing Grain Mash",true,"cornmeal"]};//new
	case "whiskey": {["yeast","whiskey",300,"Fermenting Whiskey",true,"rye"]};//new
	case "beer": {["yeast","beerp",250,"Brewing Beer",true,"hops"]};//new
	case "moonshine": {["yeast","moonshine",250,"Moonshining",true,"mash"]};//new
	case "bottledshine": {["moonshine","bottledshine",500,"Bootle Moonshine",true,"bottles"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bottle Beer",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Bottle Whiskey",true,"bottles"]};//new
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};
_2var = false;
//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
if(!isNil(_itemInfo select 4)) then {
	_2var = _itemInfo select 4;
	if(_2var) then { _oldItem2 = _itemInfo select 5;};  
}else {
	_2var = false;
};


if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
_oldVal = ITEM_VALUE(_oldItem);

//2vars
if(_2var) then { _oldVal2 = M_CONFIG(getText,"VirtualItems",_oldItem2,"displayName");}; 
_error1 = false;
_error2 = false;
if(_2var) then { 
       if(_oldVal !=_oldVal2) then {
			if(_oldVal > _oldVal2) then {_error1 = true;};
			if(_oldVal2 > _oldVal) then {_error2 = true;};
       };   
};
if(_error1) exitWith{hint format["You have too much %1, you need equal amounts",_oldItem];};
if(_error2) exitWith{hint format["You have too much %1, you need equal amounts",_oldItem2];};

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

if(player != vehicle player) exitWith {hint "You must exit your vehicle to process";};
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.03;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
	
	if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process.";
		5 cutText ["","PLAIN"];
		life_is_processing = false;
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
	};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false;
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
	};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"];
		[true,_oldItem,_oldVal] call life_fnc_handleInv;
		life_is_processing = false;
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
	};
	if(_2var) then 
			{
				
				([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				5 cutText ["","PLAIN"];
				titleText[format["You have processed %1 and %2 into %3.",localize _oldItem,localize _oldItem2,localize _itemName],"PLAIN"];
			} else
			{
				
				5 cutText ["","PLAIN"];
				titleText[format["You have processed %1 into %2.",localize _oldItem,localize _itemName],"PLAIN"];
			};
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}
	else
{
	if(CASH < _cost) exitWith {hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(CASH < _cost) exitWith {hint format["You need $%1 to process  without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false;
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
	};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv;
		life_is_processing = false;
		_ui = "osefStatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["osefStatusBar","PLAIN"];
	};
	if(_2var) then 
			{
				
				([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				5 cutText ["","PLAIN"];
				titleText[format["You have processed %1 and %2 into %3 for %4.",localize _oldItem,localize _oldItem2,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
			} else
			{
				
				5 cutText ["","PLAIN"];
				titleText[format["You have processed %1 into %2 for %3.",localize _oldVal,localize _itemName,[_cost] call life_fnc_numberText],"PLAIN"];
			};
	SUB(CASH,_cost);
	life_is_processing = false;
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};