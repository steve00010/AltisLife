scriptName "MP\data\scriptCommands\groupChat.sqf";
_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;

_caller groupChat _text;
