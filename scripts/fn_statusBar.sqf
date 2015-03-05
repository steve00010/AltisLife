#include <macro.h>
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["[ProphecyServer] Loading game server info...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 360;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 3;
		_counter = (240-(round(serverTime/60)));
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["Minutes until restart: %6 | FPS: %7 | Cops: %1 | Civs: %2 | Medics: %3 | ARC: %8 | BANK: %4 | GRIDREF: %5", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[BANK] call life_fnc_numberText,mapGridPosition player, _counter,round diag_fps, east countSide playableUnits];
	}; 
};
