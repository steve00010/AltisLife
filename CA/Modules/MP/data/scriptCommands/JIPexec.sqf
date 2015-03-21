scriptName "MP\data\scriptCommands\JIPexec.sqf";

private["_remExField","_caller","_target"];

_caller = _this select 0; //nil (but that means server)
_target = _this select 1; //

_remExField = _this select 2;


if (!isNil "BIS_DEBUG_MPF") then { textLogFormat ["MPF_ JIPexec: caller %1 target %2 _remExField: %3", _caller, _target, _remExField];};

//if functions are not initialized yet (we execute them by this file also!) we use false
private ["_func"];_func = BIS_fnc_arrayFindDeep;if (isNil "_func") then {_func = {false}; };
if (!isNil "BIS_DEBUG_MPF") then { textLogFormat ["MPF_ JIPexec: functions prepared: %1", _func];};

if ("ARRAY" == typeName  ([BIS_MPF_JIPpreventDouble, _remExField] call _func)) then
{//-1 ("SCALAR") means it is not there, array means it is there
	if (!isNil "BIS_DEBUG_MPF") then 
	{ 
		textLogFormat["MPF_JIP-doubleEXEC ERROR! (%1) %2",time, _this];
	};
}
else
{//is not there
  ["",_remExField] call BIS_MPF_remoteExecutionServer;

  	if (!isNil "BIS_DEBUG_MPF") then 
	{ 
		textLogFormat["MPF_JIP-double (%1) executing: %2 --- not in:   ",time, _this,BIS_MPF_JIPpreventDouble];
	};
};