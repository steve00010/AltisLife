scriptName "MP\data\scriptCommands\playMoveNow.sqf";
_caller = _this select 0;
_target = _this select 1;

_anim = _this select 2;

//textLogFormat ["VD17 %1",_this];
_target playMoveNow _anim;
