scriptName "MP\data\scriptCommands\playmusic.sqf";
_caller = _this select 0;
_target = _this select 1;

_music = _this select 2;
_pos = 0;

if (count _this > 3) then {
	if (typeName (_this select 3) == typeName 0) then {
		_pos = _this select 3;
		playMusic [_music, _pos]
	} else {playMusic _music}
} else {playMusic _music};