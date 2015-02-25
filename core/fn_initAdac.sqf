#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;


if((FETCH_CONST(life_adaclevel) < 1)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 60;
};


player setVariable["rank",(FETCH_CONST(life_adaclevel)),true];
[] spawn life_fnc_welcomeNotification;
waitUntil{!isNull (findDisplay 2300)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 2300)}; //Wait for the welcome to be done.

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn life_fnc_introCam;