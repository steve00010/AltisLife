scriptName "MP\data\scriptCommands\execVM.sqf";
private["_caller","_target","_data","_i"];
if (count _this < 2) exitWith {};

_caller = _this select 0;
_target = _this select 1;
_script = _this select 2;

_data = [];
_i=0;
{
	if (_i > 2) then {_data = _data + [_this select _i]};
	_i=_i+1;
} forEach _this;


if (!isNil "BIS_DEBUG_MPF") then { textLogFormat ["MPF_ caller %1 target %2 EXECVM: %3", _caller, _target, _script];};
_nic = _data execVM _script;

