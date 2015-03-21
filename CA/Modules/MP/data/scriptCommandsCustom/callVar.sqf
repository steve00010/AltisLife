//executes code that is stored in given variable (on receiving client!)

scriptName "MP\data\scriptCommandsCustom\callVar.sqf";


if (count _this < 4) exitWith 
{
  textLogFormat ["MPF_ ERROR: callVar - not enough parameters! (_caller, _target, _args, _variable) %1", _this];
};

_caller = _this select 0;
_target = _this select 1;
_args = _this select 2;
_variable = _this select 3;


private ["_code"];

call compile format ["_code = %1", _variable];

if (typeName _code != typeName {}) exitWith 
{
  textLogFormat ["MPF_ ERROR: callVar - given variable not storing code on this client! (_caller, _target, _args, _variable) %1", _this]; 
};

_args call _code;

