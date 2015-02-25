#include <macro.h>
#define INUSE(ENTITY) ENTITY SVAR ["inUse",false,true]
/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private ["_itemInfo","_itemName","_illegal","_diff"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((time - life_action_delay) < 2) exitWith {hint "You can't rapidly use action keys!"; INUSE(_obj);};

if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj GVAR ["item",[]]; 
if(EQUAL(count _itemInfo,0)) exitWith {deleteVehicle _this;};
_itemName = ITEM_NAME(SEL(_itemInfo,0));
_illegal = ITEM_ILLEGAL(SEL(_itemInfo,0));

if(playerSide == west && (EQUAL(_illegal,1))) exitWith {
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[round(ITEM_SELLPRICE(SEL(_itemInfo,0)) / 2)] call life_fnc_numberText],"PLAIN"];
	ADD(BANK,round(ITEM_SELLPRICE(SEL(_itemInfo,0)) / 2));
	deleteVehicle _obj;
	life_action_delay = time;
};

life_action_delay = time;
_diff = [SEL(_itemInfo,0),SEL(_itemInfo,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"; INUSE(_obj);};

if(!(EQUAL(_diff,SEL(_itemInfo,1)))) then {
	if(([true,SEL(_itemInfo,0),_diff] call life_fnc_handleInv)) then {
		player playMove "AinvPknlMstpSlayWrflDnon";
		
		_obj SVAR ["item",[SEL(_itemInfo,0),(SEL(_itemInfo,1)) - _diff],true];
		titleText[format[localize "STR_NOTF_Picked",_diff,localize _itemName],"PLAIN"];
		INUSE(_obj);
	} else {
		INUSE(_obj);
	};
} else {
	if(([true,SEL(_itemInfo,0),SEL(_itemInfo,1)] call life_fnc_handleInv)) then {
		deleteVehicle _obj;
		//waitUntil{isNull _this};
		player playMove "AinvPknlMstpSlayWrflDnon";
		
		titleText[format[localize "STR_NOTF_Picked",_diff,localize _itemName],"PLAIN"];
	} else {
		INUSE(_obj);
	};
};