scriptName "MP\data\scriptCommands\globalRadio.sqf";

_caller = _this select 0;
_target = _this select 1;
_msg = _this select 2;

_caller globalRadio _msg;