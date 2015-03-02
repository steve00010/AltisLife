#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes ARC
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((FETCH_CONST(life_arclevel) < 1)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 60;
};

[] spawn life_fnc_welcomeNotification;
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn life_fnc_introCam;