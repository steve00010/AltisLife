scriptName "MP\data\scriptCommands\kbRemoveTopic.sqf";
_caller = _this select 0;
_target = _this select 1;

_topic = _this select 2;


_target kbRemoveTopic _topic;
