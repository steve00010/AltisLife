scriptName "MP\data\scriptCommands\addWeaponCargo.sqf";
_caller = _this select 0;
_target = _this select 1;
_box = _this select 2;
_wpn = _this select 3;
_cnt = _this select 4;

_box addWeaponCargo [_wpn, _cnt];