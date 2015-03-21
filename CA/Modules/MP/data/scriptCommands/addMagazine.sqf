scriptName "MP\data\scriptCommands\addMagazine.sqf";
_caller = _this select 0;
_target = _this select 1;
_mag = _this select 2;

_caller addMagazine _mag;