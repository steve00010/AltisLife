scriptName "MP\data\scriptCommands\animate.sqf";
_caller = _this select 0;
_target = _this select 1;

_obj = _this select 2;
_anim = _this select 3;
_phase = _this select 4;

_obj animate [_anim, _phase]