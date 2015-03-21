scriptName "MP\data\scriptCommands\setObjectTexture.sqf";
_caller = _this select 0;
_target = _this select 1;
_tObject = _this select 2;
_tIndex = _this select 3;
_texture = _this select 4;

//textLogFormat ["MPF_ %1 setDir %2", _target, _dir];
_tObject setObjectTexture [_tIndex, _texture];
