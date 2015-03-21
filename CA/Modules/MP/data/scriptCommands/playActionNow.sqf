scriptName "MP\data\scriptCommands\playActionNow.sqf";
_caller = _this select 0;
_target = _this select 1;

_action = _this select 2;

_target playActionNow _action;
