scriptName "MP\data\scriptCommands\spawn.sqf";
_caller = _this select 0;
_target = _this select 1;
_args = _this select 2;
_code = _this select 3;

_args spawn _code;