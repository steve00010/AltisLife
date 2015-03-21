scriptName "MP\data\scriptCommands\setSimpleTaskDescription.sqf";
/*_caller = _this select 0;
_target = _this select 1;

_task = _this select 2; //typename is "TASK" (usual engine-like function -setting task to target) or "STRING" (-> special - usage of BIS_missionScope, and its arrays, iterating whole group)
_textDescriptionArray = _this select 3;

//_task setSimpleTaskDescription _textArray;




if ((typeName (_task)) == "STRING") then 
{
  if (isNil{(BIS_missionScope getVariable (_task+"TaskArray"))}) exitWith {textLog "MPF_ Warning: TaskArray not defined in BIS_missionScope";};
  _taskArray = BIS_missionScope getVariable (_task+"TaskArray");
}
else
{
  _task setSimpleTaskDescription _textDescriptionArray; 
};

if ((typeName (_task)) != "STRING") exitWith {};

{
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setSimpleTaskDescription %1 %2", _x,_textDescriptionArray];      
  };
  _x setSimpleTaskDescription _textDescriptionArray;
} foreach _taskArray;
*/



_caller = _this select 0;
_target = _this select 1;

_task = _this select 2; //typename is "TASK" (usual engine-like function -setting task to target) or "STRING" (-> special - usage of BIS_missionScope, and its arrays, iterating whole group)
_textDescriptionArray = _this select 3;


private ["_taskArray"];


if ((typeName (_task)) == "STRING") then 
{
  if (isNil "BIS_missionScope") exitWith {textLogFormat["ERROR: MPF_rSETSIMPLETASKDESCRIPTION calls fails - no BIS_missionScope logic"];};
  if (isNil{(BIS_missionScope getVariable (_task+"TaskArray"))}) exitWith {textLog "MPF_ Warning: TaskArray not defined in BIS_missionScope";};
  _taskArray = BIS_missionScope getVariable (_task+"TaskArray");
}
else
{
  _task setSimpleTaskDescription _textDescriptionArray;  
};




if ((typeName (_task)) != "STRING") exitWith {};

  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setSimpleTaskDescription here %1 ta %2", _task, _taskArray];      
  };
  
{
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setSimpleTaskDescription  _x %1", _x];      
  };
  
  _x setSimpleTaskDescription _textDescriptionArray;
} foreach _taskArray;
