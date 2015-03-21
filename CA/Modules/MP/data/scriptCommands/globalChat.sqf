scriptName "MP\data\scriptCommands\globalChat.sqf";

_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;

_caller globalChat _text;