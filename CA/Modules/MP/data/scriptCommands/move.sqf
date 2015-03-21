scriptName "MP\data\scriptCommands\move.sqf";
_caller = _this select 0;
_target = _this select 1;
_position = _this select 2;

//textLogFormat["SOM_ phase %1 %2", BIS_TRANSPORTER0 getVariable "supPhase",_position];

_target move _position;