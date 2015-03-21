scriptName "MP\data\scriptCommands\deleteWP.sqf";
private["_caller","_target","_index"];

_caller = _this select 0;
_target = _this select 1;
_index = _this select 2;

deleteWaypoint [(group _target), _index];
