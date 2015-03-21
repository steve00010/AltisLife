scriptName "MP\data\scriptCommands\createMarkerLocal.sqf";
_caller = _this select 0;
_target = _this select 1;
_markerName = _this select 2;
_markerpos = _this select 3; 
_marker = "";

_marker = createMarkerLocal [_markerName, _markerpos];
_marker 	