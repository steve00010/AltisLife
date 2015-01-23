/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Withdraw from the bank
*/

private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > pbh_life_atmcash) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if(_val < 100 && pbh_life_atmcash > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

["cash","add",_value] call life_fnc_updateCash;
["atm","take",_value] call life_fnc_updateCash;



hint format[localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
