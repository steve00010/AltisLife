#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_vehicleInfo","_ctrl","_DiscountMod","_sellPrice","_claimPrice","_DiscountText"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_price = _control lbValue _index;

_originalOwner = "Unknown";
_DiscountText = "";

ctrlShow [5830,true];
(CONTROL(5800,5803)) ctrlSetStructuredText parseText format[
"Sell Price: <t color='#8cff9b'>$%1</t><br/>Claim Cost: <t color='#8cff9b'>$%2</t><br/><br/>Current Owner: %3<br/><br/><t color='#8cff9b'>%4</t>",
[_price] call life_fnc_numberText,
[round(_price)] call life_fnc_numberText,
_originalOwner,
_DiscountText
];

true;