scriptName "MP\data\scriptCommands\playsound.sqf";
_caller = _this select 0;
_target = _this select 1;

_sound = _this select 2;

playsound _sound;
