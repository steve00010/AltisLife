#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_buylist = _display displayCtrl 39002;
_selllist = _display displayCtrl 39003;

lbClear _buylist;
lbClear _selllist;

{
	if((_x select 1)>0) then {
		_name = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_vartostr;
		_icon = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_itemIcon;
		_price = _x select 1;
		_selllist lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
		_selllist lbSetData [(lbSize _selllist)-1,_x select 0];
		_selllist lbSetValue [(lbSize _selllist)-1,(lbSize _selllist)-1];
		_selllist lbSetPicture [(lbSize _selllist)-1,_icon];
	};
} foreach (__GETC__(sell_array));

{
	if((_x select 1)>0) then {
		_name = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_vartostr;
		_icon = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_itemIcon;
		_price = _x select 1;
		_buylist lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
		_buylist lbSetData [(lbSize _buylist)-1,_x select 0];
		_buylist lbSetValue [(lbSize _buylist)-1,(lbSize _buylist)-1];
		_buylist lbSetPicture [(lbSize _buylist)-1,_icon];
		
	};
} foreach (__GETC__(buy_array));

lbSortByValue _selllist;
lbSortByValue _buylist;