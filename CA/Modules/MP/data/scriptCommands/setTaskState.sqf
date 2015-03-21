scriptName "MP\data\scriptCommands\setTaskState.sqf";
_caller = _this select 0;
_target = _this select 1;

_task = _this select 2; //typename is "TASK" (usual engine-like function -setting task to target) or "STRING" (-> special - usage of BIS_missionScope, and its arrays, iterating whole group)
_state = _this select 3;

_taskName = _task;

//_nic = [objNull, objNull, rSETTASKSTATE, BIS_missionScope getVariable "obj2a", "Failed"] call RE
//where obj2a is either task or task array
private["_taskArray","_taskArrayObjects"];

if ((typeName (_task)) == "STRING") then 
{
  if (isNil "BIS_missionScope") exitWith {textLogFormat["ERROR: MPF_rSETTASKSTATE calls fails - no BIS_missionScope logic"];};
  if (isNil{(BIS_missionScope getVariable (_task+"TaskArray"))}) exitWith {textLog "MPF_ Warning: TaskArray not defined in BIS_missionScope";};
  _taskArray = BIS_missionScope getVariable (_task+"TaskArray");
  _taskArrayObjects = BIS_missionScope getVariable (_task+"Objects");
}
else
{
  _task setTaskState _state;  
};

_group = group (_taskArrayObjects select 0);

if (isNil "_group") exitWith {};

if ((typeName (_task)) != "STRING") exitWith {};

// task hint
{if (isPlayer _x && local _x && taskState (_taskArray select 0) != _state) then {[objNull, objNull, _taskArray select 0, _state] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf")}} forEach units _group;

// rating bonus / penalty
if (!(isNil {BIS_missionScope getVariable (_task + "_rating")})) then {
	_taskRating = BIS_missionScope getVariable (_task + "_rating");
	{
		if (_state == "succeeded") then {_x addRating _taskRating};
		if (_state == "failed") then {_x addRating -(_taskRating)}
	} forEach _taskArrayObjects
};

{
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setTaskState  _x %1", _x];      
  };
  _x setTaskState _state;
} foreach _taskArray;

BIS_missionScope setVariable [_taskName+"TaskState", _state, TRUE]; //MUST BE SAVED FOR ALL PLAYERS HERE!