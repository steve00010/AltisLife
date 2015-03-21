scriptName "MP\data\scriptCommands\setWPdesc.sqf";
private["_caller","_target","_index","_desc"];

_caller = _this select 0;
_target = _this select 1;
_index = _this select 2;
_desc = _this select 3;

[(group _target),_index] setWaypointDescription _desc;