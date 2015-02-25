#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

_msg = format["%1 spectated %2 (%3)",profileName,_unit getVariable["realname", _unit], getPlayerUID _unit];
[[_msg],"life_fnc_logMSG",false,false] spawn life_fnc_MP;

_unit switchCamera "INTERNAL";
hint format["You are now spectating %1 \n\n Press F10 to stop Spectating.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'You have stopped spectating';};_msg = format['%1  stopped spectating %2 (%3)',profileName,_unit getVariable['realname', _unit], getPlayerUID _unit];
[[_msg],'life_fnc_logMSG',false,false] spawn life_fnc_MP;false"];