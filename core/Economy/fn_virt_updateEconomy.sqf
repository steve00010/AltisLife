#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Worldtrade1101
	Base on Tonic script
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_achatliste","_gear_list","_shop_data","_name","_price"];
disableSerialization;
_array = [_this,1,[],[[]]] call BIS_fnc_param;
{	
	buy_array pushBack [_x select 0,_x select 1];
	sell_array pushBack [_x select 0,_x select 2];
}forEach _array;

CONST(buy_array,buy_array);
CONST(sell_array,sell_array);