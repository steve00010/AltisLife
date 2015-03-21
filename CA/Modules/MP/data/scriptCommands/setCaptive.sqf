scriptName "MP\data\scriptCommands\setCaptive.sqf";
_caller = _this select 0;
_target = _this select 1;
_state = _this select 2;

_target setCaptive _state;