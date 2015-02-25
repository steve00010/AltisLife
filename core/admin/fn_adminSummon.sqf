#include <macro.h>
/*
	File: fn_adminSummon.sqf
	Author: Paul "Jerico" Smith / Steve
 
	Description: Summons a player onto Teamspeak
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_Admin_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
//if(_unit == player) exitWith {hint localize "STR_Admin_Error";};

_msg = "You have been summoned to TeamSpeak by an Admin. (85.236.101.5:11377)";

[[_msg,"Server",3],"TON_fnc_clientMessage",_unit,false] spawn life_fnc_MP;


hint format["You summoned %1 to TS",_unit getVariable["realname",_unit]];