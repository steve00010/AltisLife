scriptName "MP\data\scriptCommands\switchAction.sqf";
_caller = _this select 0;
_target = _this select 1;

_action = _this select 2;

_target switchAction _action;
