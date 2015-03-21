scriptName "MP\data\scriptCommands\createDiaryRecord.sqf";
_caller = _this select 0;
_target = _this select 1;

_topic = _this select 2;
_text = _this select 3;

if (typeName _topic == "CODE") then {
	_newRecord = _target createDiaryRecord ["Diary", [call _topic, call _text]];
} else {
	_newRecord = _target createDiaryRecord ["Diary", [_topic, _text]];
};