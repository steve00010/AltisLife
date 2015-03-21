scriptName "MP\data\scriptCommands\setCaptive.sqf";
_caller = _this select 0;
_target = _this select 1;
_identity = _this select 2;

group _target setGroupID [_identity];