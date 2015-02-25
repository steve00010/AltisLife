#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_target setPos (getPos player);
hint format["You have teleported %1 to your location",_target getVariable["realname",name _target]];
_msg = format["%1 teleported %2 (%3) to their location",profileName,_unit getVariable["realname", _unit], getPlayerUID _unit];
[[_msg],"life_fnc_logMSG",false,false] spawn life_fnc_MP;