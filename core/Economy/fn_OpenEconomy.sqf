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

	_displayName = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
	_price = SEL(_x,1);
	if(_price > 0) then {
		_selllist lbAdd format["%1  ($%2)",(localize _displayName),[_price] call life_fnc_numberText];
		_selllist lbSetData [(lbSize _selllist)-1,SEL(_x,0)];
		_selllist lbSetValue [(lbSize _selllist)-1,(lbSize _selllist)-1];
		_icon = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"icon");
		if(!(EQUAL(_icon,""))) then {
			_selllist lbSetPicture [(lbSize _selllist)-1,_icon];
		};
	};
} foreach (FETCH_CONST(sell_array));

{

	_displayName = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
	_price = SEL(_x,1);
	if(_price > 0) then {
		_buylist lbAdd format["%1  ($%2)",(localize _displayName),[_price] call life_fnc_numberText];
		_buylist lbSetData [(lbSize _buylist)-1,SEL(_x,0)];
		_buylist lbSetValue [(lbSize _buylist)-1,(lbSize _buylist)-1];
		_icon = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"icon");
		if(!(EQUAL(_icon,""))) then {
			_buylist lbSetPicture [(lbSize _buylist)-1,_icon];
		};
	};
} foreach (FETCH_CONST(buy_array));

lbSortByValue _selllist;
lbSortByValue _buylist;