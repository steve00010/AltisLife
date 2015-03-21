scriptName "MP\data\scriptCommands\titleCut.sqf";
_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;
_typeF = _this select 3;
_timeF = _this select 4;

titleCut [_text, _typeF, _timeF];