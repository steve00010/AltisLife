scriptName "MP\data\scriptCommands\addEventhandler.sqf";
_caller = _this select 0;
_target = _this select 1;
_handlerType = _this select 2;
_code = _this select 3; 

_target addEventHandler	[_handlerType, _code];

