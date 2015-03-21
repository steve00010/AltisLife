scriptName "MP\data\scriptCommands\execFSM.sqf";
private["_caller","_target","_data","_i"];
if (count _this < 2) exitWith {};

_caller = _this select 0;
_target = _this select 1;
_fsm = _this select 2;


_data = [];
_i=0;
{
	if (_i > 2) then {_data = _data + [_this select _i]};
	_i=_i+1;
} forEach _this;

_nic = _data execFSM _fsm;
