/*
	File: fn_updateCash.sqf
	Author: Skalicon / Paratus - Steve
	
	Description:
	Updates the players Inventory and ATM cash.
*/
//if (isServer) exitWith {};

private ["_type","_modifier","_amount"];
_type = _this select 0;
_modifier = _this select 1;
_amount = _this select 2;

if (_type == "atm") then {
	if (_modifier == "add") then {
		life_atmcash = life_atmcash + _amount;
		//[[format["%3's ATM: Added %1 and now has $%2",_amount,life_atmcash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "take") then {
		pbh_life_atmcash = pbh_life_atmcash - _amount;
	//	[[format["%3's ATM: Removed %1 and has $%2 remaining",_amount,life_atmcash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "set") then {
		pbh_life_atmcash = _amount;
	//	[[format["%2's ATM: set to the amount of $%1",life_atmcash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		pbh_life_cash = life_cash + _amount;
	//	[[format["%3's Cash: Added %1 and now has $%2",_amount,life_cash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "take") then {
		pbh_life_cash = pbh_life_cash - _amount;
	//	[[format["%3's Cash: Removed %1 and has $%2 remaining",_amount,life_cash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "set") then {
		pbh_life_cash = _amount;
	//	[[format["%2's Cash: set to the amount of $%1",life_cash,profileName]],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	};
};

[] call SOCK_fnc_updateRequest;