scriptName "MP\data\scriptCommands\fadeSound.sqf";
_caller = _this select 0;
_target = _this select 1;

_seconds = _this select 2;
_value = _this select 3;

_seconds fadeSound _value;
