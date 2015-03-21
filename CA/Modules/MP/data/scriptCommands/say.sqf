scriptName "MP\data\scriptCommands\say.sqf";

_caller = _this select 0;
_target = _this select 1;

_sample = _this select 2;

//check for obsolete script call
if (isNull _target) then {_target = _this select 2; _sample = _this select 3};

_target say _sample