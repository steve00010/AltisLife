scriptName "MP\data\scriptCommands\setDir.sqf";
_caller = _this select 0;
_target = _this select 1;
_dir = _this select 2;


textLogFormat ["MPF_ %1 setDir %2", _target, _dir];
_target setDir _dir;
//_target setPos getPos _target;