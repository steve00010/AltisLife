
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
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["Minutes until restart: %1 | FPS: %2 | Players: %3 | GRIDREF: %4",_counter,round diag_fps, west countSide playableUnits, mapGridPosition player];
	}; 
};
