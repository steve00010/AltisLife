scriptName "MP\data\scriptCommands\addMagazineCargo.sqf";
_caller = _this select 0;
_target = _this select 1;
_box = _this select 2;
_mag = _this select 3;
_cnt = _this select 4;

_box addMagazineCargo [_mag, _cnt];