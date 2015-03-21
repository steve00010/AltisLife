scriptName "MP\data\scriptCommands\kbAddTopic.sqf";
_caller = _this select 0;
_target = _this select 1;

if (isNil "_target") then {_target = player;}; //used to add easily to all clients in MP
if (isNull _target) then {debugLog "MPF_ Warning: null object passed as target in rKBADDTOPIC RE call."};

_topic = _this select 2;
_bikb = _this select 3;
_fsm = _this select 4;
if (count _this > 5) then {_code = _this select 5};

if (count _this < 6) then {
	_target kbAddTopic [_topic, _bikb, _fsm]
} else {
	_target kbAddTopic [_topic, _bikb, _fsm, _code]
};