/*
	File: fn_moneyCheck.sqf
	Author: Steve
	Checks player money vs playtime for money hacks
*/
private ["_returnMe","_UID"];
_playtime = _this select 0;
_returnMe = true;

if((_playtime < 7200 && BANK > 1500000) OR( _playtime < 7200 && CASH > 1500000)) then {
	_returnMe = false;
};
if((_playtime < 14400 && BANK > 4000000) OR ( _playtime < 7200 && CASH > 4000000)) then {
	_returnMe = false;
};
if(CASH > 300000000 OR BANK > 300000000) then {
	_returnMe = false;
};
if(!(_returnMe)) then { 
	_msg = format["%1 has %2 in bank and %3 in cash but only %4 in playtime, been kicked",profileName,BANK,CASH,_playtime];
	[[_msg],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
	failMission "SpyGlass";
};
_returnMe