scriptName "MP\data\scriptCommands\playAction.sqf";
_caller = _this select 0;
_target = _this select 1;

_action = _this select 2;

_target playAction _action;
