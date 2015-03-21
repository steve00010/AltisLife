scriptName "MP\data\scriptCommands\setWPtype.sqf";
private["_caller","_target","_typ","_index"];

_caller = _this select 0;
_target = _this select 1;
_typ = _this select 2;
_index = _this select 3;


[group _target,_index] setwaypointtype _typ;

