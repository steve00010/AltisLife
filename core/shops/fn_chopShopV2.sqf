#include <macro.h>
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_mode = _this select 0;

_control = CONTROL( 5800, 5802);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = SEL(_nearVehicles,_vehicle);

if(isNull _vehicle) exitWith {};
if((lbCurSel 5802) == -1) exitWith {hint "You did not pick a vehicle!"};

if (_mode == 0) then
{

	hint "Selling vehicle please wait....";
	life_action_inUse = true;
	_price2 = CASH + _price;
	[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn life_fnc_MP;
	closeDialog 0;
}
else
{
	
	if ([_vehicle] call life_fnc_isDonarVehicle ) exitWith 
	{
		hint "God himself wouldn't touch this vehicle. Get out of here";
		closeDialog 0;
	};

	if (CASH >= _price) then
	{
		hint "Claiming vehicle please wait....";
		life_action_inUse = true;
		_price2 =life_cash - _price;
		[[player,_vehicle,_price,_price2],"TON_fnc_chopShopClaim",false,false] spawn life_fnc_MP;
		closeDialog 0;
	}
	else
	{
		hint "You do not have enough money to claim this vehicle";
		closeDialog 0;
	};
	
}


