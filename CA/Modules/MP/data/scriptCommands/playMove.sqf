scriptName "MP\data\scriptCommands\playMove.sqf";
_caller = _this select 0;
_target = _this select 1;

_anim = _this select 2;

//textLogFormat ["VD17 %1",_this];
_target playMove _anim;
