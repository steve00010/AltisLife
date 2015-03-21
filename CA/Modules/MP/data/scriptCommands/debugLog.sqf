scriptName "MP\data\scriptCommands\hint.sqf";
_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;


if (count _this < 3) exitWith {};

debugLog _text;
