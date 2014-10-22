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

_control = ((findDisplay 5800) displayCtrl 5802);
_className = lbData[5802,(lbCurSel 5802)];
_vIndex = lbValue[5802,(lbCurSel 5802)];

if((lbCurSel 5802) == -1) exitWith {hint "You did not pick a vehicle!"};

if (_mode == 0) then
{
	// Sell the Vehicle
	_ind = [_className,(call life_garage_sell)] call TON_fnc_index;
	diag_log format[ "Index for Garage Sell is %1 for classname %2", _ind, _className ];
	if(_ind != -1) then
	{
		_price = ((call life_garage_sell) select _ind) select 1;
		diag_log format[ "Price for Garage Sell is %1", _price ];
	}
	else
	{
		_price = 0;
	};
	
	_vehicle = _control lbValue (lbCurSel _control);
	_vehicle = call compile format["%1", _vehicle];
	_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],25];
	_vehicle = _nearVehicles select _vehicle;
	if(isNull _vehicle) exitWith {};

	hint "Selling vehicle please wait....";
	life_action_inUse = true;
	_price2 = pbh_life_cash + _price;
	[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn life_fnc_MP;
	closeDialog 0;
}
else
{
	// claim the Vehicle
	_ind = [_className,(call life_garage_chop)] call TON_fnc_index;
	diag_log format[ "Index for Garage chop is %1 for classname %2", _ind, _className ];
	if(_ind != -1) then
	{
		_price = ((call life_garage_chop) select _ind) select 1;
		diag_log format[ "Price for Garage chop is %1", _price ];
	}
	else
	{
		_price = 0;
	};
	
	_vehicle = _control lbValue (lbCurSel _control);
	_vehicle = call compile format["%1", _vehicle];
	_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],25];
	_vehicle = _nearVehicles select _vehicle;
	if(isNull _vehicle) exitWith {};

	if ([_vehicle] call life_fnc_isDonarVehicle ) exitWith 
	{
		hint "God himself wouldn't touch this vehicle. Get out of here";
		closeDialog 0;
	};

	if (pbh_life_cash >= _price) then
	{
		hint "Claiming vehicle please wait....";
		life_action_inUse = true;
		_price2 = pbh_life_cash - _price;
		[[player,_vehicle,_price,_price2],"TON_fnc_chopShopClaim",false,false] spawn life_fnc_MP;
		closeDialog 0;
	}
	else
	{
		hint "You do not have enough money to claim this vehicle";
		closeDialog 0;
	};
	
}


