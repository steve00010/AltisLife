/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
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
