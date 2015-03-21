scriptName "MP\data\scriptCommands\setCurrentTask.sqf";
_caller = _this select 0;
_target = _this select 1;

_task = _this select 2; //typename is "TASK" (usual engine-like function -setting task to target) or "STRING" (-> special - usage of BIS_missionScope, and its arrays, iterating whole group)
//_taskArray = _this select 2; //array of tasks
//_taskObjects = _this select 3; //array of objects (first object has assigned first task from _tasArray)
//_target setCurrentTask _task;
//_nic = [objNull, player, rSETCURRENTTASK, BIS_missionScope getVariable "obj2",BIS_missionScope getVariable "obj2Objects"] call RE;


//if _task is Array - for each member of group of target: his respective (that was created for him and stored in array) task is set to him as current
//         is not Array - (supposing) its task, setting current for _target

private["_taskArray","_taskObjects"];

if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rsetCurrentTaskArrays (typeName (_task)) %1", (typeName (_task))];
      };

if ((typeName (_task)) == "STRING") then 
{
  if (isNil{(BIS_missionScope getVariable (_task+"TaskArray"))}) exitWith {textLog "MPF_ Warning: TaskArray not defined in BIS_missionScope";};
  _taskArray = BIS_missionScope getVariable (_task+"TaskArray");
  if (isNil{(BIS_missionScope getVariable (_task+"Objects"))}) exitWith {textLog "ERROR: Objects (for tasks) not defined in BIS_missionScope";};
  _taskObjects = BIS_missionScope getVariable (_task+"Objects");
}
else
{
  _target setCurrentTask _task;  
  //{if (isPlayer _x) then {_nic = [objNull, _x, "loc", rTASKHINT, _taskArray select ((_taskArrayObjects) find _x), "current"] call RE}} forEach _taskArrayObjects;
  {if (isPlayer _x && local _x) then {[objNull, objNull, _taskArray select ((_taskArrayObjects) find _x), "current"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf")}} forEach _taskArrayObjects;
};

if ((typeName (_task)) != "STRING") exitWith {};



_group = group _target;

if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rsetCurrentTaskArrays %1 group %2 tasks %3 objects %4", _target, _group, _taskArray, _taskObjects];
      };

/*{
  private["_who"];
  _who = _x;
  _set = TRUE;
  
  textLogFormat["MPF_rsetCurrentTaskArrays _who %1", _who];

    private["_i"];
    _i=0;
    {
      if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rsetCurrentTaskArrays (trying) %2 to _x %1 ", _who,_x];
      };  
      
      if (_who == (_taskObjects select _i)) then
      {
      _who setCurrentTask _x;
      textLogFormat ["%1", _taskobjects select _i];

      //{if (isPlayer _who && _set && !(taskState (_taskArray select ((_taskObjects) find _x)) in ["Succeeded", "Failed", "Canceled"])) then {_set = FALSE; _nic = [objNull, _who, "loc", rTASKHINT, _taskArray select ((_taskObjects) find _who), "current"] call RE}} forEach _taskObjects;
      {if (isPlayer _who && _set && !(taskState (_taskArray select ((_taskObjects) find _x)) in ["Succeeded", "Failed", "Canceled"])) then {_set = FALSE; [objNull, objNull, _taskArray select ((_taskObjects) find _who), "current"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf")}} forEach _taskObjects;
      
      if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rsetCurrentTaskArrays %2 to _x %1 ", _who,_x];
      };  
      };
              
      _i = _i + 1;
    } foreach _taskArray; 
    _set = TRUE;
  
} foreach units _group;*/

{
	if (isPlayer _x && local _x) then {
		if (!(taskCompleted (_taskArray select (_taskObjects find _x)))) then {
			_theTask = _taskArray select (_taskObjects find _x);
			[objNull, objNull, _theTask, "current"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf");
			_x setCurrentTask _theTask
		}
	}
} forEach units _group