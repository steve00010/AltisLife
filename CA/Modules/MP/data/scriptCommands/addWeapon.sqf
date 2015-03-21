scriptName "MP\data\scriptCommands\addWeapon.sqf";
_caller = _this select 0;
_target = _this select 1;
_wpn = _this select 2;

_caller addWeapon _wpn;