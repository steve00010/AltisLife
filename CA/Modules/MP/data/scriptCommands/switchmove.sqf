scriptName "MP\data\scriptCommands\switchmove.sqf";
_caller = _this select 0;
_target = _this select 1;
_move = _this select 2;

_target switchmove _move;
