scriptName "MP\data\scriptCommands\taskHint.sqf";

if (time < 1) exitWith {};

_caller = _this select 0;
_target = _this select 1;

_task = _this select 2;
_status = _this select 3;

if (count _this < 4) exitWith {};

private ["_params"];

textLogFormat ["%1 :: %2 :: %3 :: %4", _caller, _target, _task, _status];

_notifications = ["created", "current", "succeeded", "failed", "canceled"];

if (!(isNil {BIS_missionScope getVariable "BIS_task_notify"})) then {_notifications = (BIS_missionScope getVariable "BIS_task_notify")};

if ({_status == _x} count _notifications == 0) exitWith {};

if (_status == "created") then {_params = [localize "str_taskNew", [1,1,1,1], "taskNew"]};
if ((_status == "current") || (_status == "assigned")) then {_params = [localize "str_taskSetCurrent", [1,1,1,1], "taskCurrent"]};
if (_status == "succeeded") then {_params = [localize "str_taskAccomplished", [0.600000,0.839215,0.466666,1.000000], "taskDone"]};
if (_status == "failed") then {_params = [localize "str_taskFailed", [0.972549,0.121568,0.000000,1.000000], "taskFailed"]};
if (_status == "canceled") then {_params = [localize "str_taskCancelled", [0.750000,0.750000,0.750000,1.000000], "taskFailed"]};

//disabled because of scripting time limitations

/*_params = switch (_status) do {
	case "created": {["NEW TASK ASSIGNED:", [1,1,1,1]]};
	case "succeeded": {["TASK ACCOMPLISHED:", [0.600000,0.839215,0.466666,1.000000]]};
	case "failed": {["TASK FAILED:", [0.972549,0.121568,0.000000,1.000000]]}
};*/

taskHint [format [(_params select 0) + "\n%1", (taskDescription _task) select 1], (_params select 1), (_params select 2)];