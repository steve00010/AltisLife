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
_vIndex = _control lbValue _index;

_ind = [_className,(call life_garage_sell)] call TON_fnc_index;
if(_ind != -1) then
{
	_sellPrice = ((call life_garage_sell) select _ind) select 1;
	ctrlEnable [5808,true];
}
else
{
	_sellPrice = 0;
	ctrlEnable [5808,false];
};

if ( (playerSide == west) or ((playerSide == independent )) ) then
{
	_sellPrice = 0;
};
	
_ind = [_className,(call life_garage_chop)] call TON_fnc_index;
if(_ind != -1) then
{
	_claimPrice = ((call life_garage_chop) select _ind) select 1;
	ctrlEnable [5806,true];
}
else
{
	_claimPrice = 0;
	ctrlEnable [5806,false];
};

_originalOwner = "Unknown";
_DiscountText = "";

ctrlShow [5830,true];
(getControl(5800,5803)) ctrlSetStructuredText parseText format[
"Sell Price: <t color='#8cff9b'>$%1</t><br/>Claim Cost: <t color='#8cff9b'>$%2</t><br/><br/>Current Owner: %3<br/><br/><t color='#8cff9b'>%4</t>",
[_sellPrice] call life_fnc_numberText,
[round(_claimPrice)] call life_fnc_numberText,
_originalOwner,
_DiscountText
];

true;