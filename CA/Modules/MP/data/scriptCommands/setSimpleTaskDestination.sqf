scriptName "MP\data\scriptCommands\setSimpleTaskDestination.sqf";
_caller = _this select 0;
_target = _this select 1;

_task = _this select 2; //typename is "TASK" (usual engine-like function -setting task to target) or "STRING" (-> special - usage of BIS_missionScope, and its arrays, iterating whole group)
_destination = _this select 3;


private ["_taskArray"];
  
//_task setSimpleTaskDestination _destination;


if ((typeName (_task)) == "STRING") then 
{
  if (isNil "BIS_missionScope") exitWith {textLogFormat["ERROR: MPF_rSETSIMPLETASKDESTINATION calls fails - no BIS_missionScope logic"];};
  if (isNil{(BIS_missionScope getVariable (_task+"TaskArray"))}) exitWith {textLog "MPF_ Warning: TaskArray not defined in BIS_missionScope";};
  _taskArray = BIS_missionScope getVariable (_task+"TaskArray");
}
else
{
  _task setSimpleTaskDestination _destination;  
};




if ((typeName (_task)) != "STRING") exitWith {};

  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setSimpleTaskDestination here %1 ta %2", _task, _taskArray];      
  };
  
{
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setSimpleTaskDestination  _x %1", _x];      
  };
  
  _x setSimpleTaskDestination _destination;
} foreach _taskArray;

BIS_missionScope setVariable ["BIS_AITasks_recalcWPs", TRUE];