scriptName "MP\data\scriptCommands\switchCamera.sqf";
_caller = _this select 0;
_target = _this select 1;

_view = _this select 2;

//textLogFormat ["VD17 %1",_this];
_target switchCamera _view;
