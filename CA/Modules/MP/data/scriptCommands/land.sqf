scriptName "MP\data\scriptCommands\land.sqf";
_caller = _this select 0;
_target = _this select 1;
_mode = _this select 2;

textLogFormat["SOM_  %1 LAND %2", _target,_mode];

_target land _mode;