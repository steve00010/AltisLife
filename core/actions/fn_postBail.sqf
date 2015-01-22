/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(pbh_life_atmcash < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

//pbh_life_atmcash = pbh_life_atmcash - life_bail_amount;
["ATM","take",life_bail_amount] call life_fnc_updateCash;
life_bail_paid = true;
[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;