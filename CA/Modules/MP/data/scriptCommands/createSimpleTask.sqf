scriptName "MP\data\scriptCommands\createSimpleTask.sqf";
private ["_caller","_target","_taskName","_group","_taskArray", "_newTask"];

_caller = _this select 0;
_target = _this select 1;
_taskName = _this select 2;


///[] spawn {" \n "	_nic = [player, objNull, rCREATESIMPLETASK, ""obj7""] call RE;
///      init = /*%FSM<STATEINIT""">*/"_nic = [objNull, objNull, rSETTASKSTATE, BIS_missionScope getVariable ""obj0"", ""Succeeded""] call RE;" \n "" \n 


///[] spawn {" \n "	_nic = [BIS_Cooper, objNull, rCREATESIMPLETASK, ""obj7""] call RE;

_group = group _caller;

if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rCREATESIMPLETASK %1 group %2", _caller, _group];
      };


_taskArray = [];
_taskArrayObjects = []; //objects that has this task assigned
{
  /*
    if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_rCREATESIMPLETASK  setting for: %1 isPlayer: %2", _x, isPlayer _x];
      };
    */  
      

  _newTask = _x createSimpleTask [_taskName];    
    
  _taskArray = [_newTask] + _taskArray;
  _taskArrayObjects = _taskArrayObjects + [_x];
      
      
} foreach units _group;     


if (!isNil "BIS_DEBUG_MPF") then 
  {
  textLogFormat["MPF_rCREATESIMPLETASK _taskArray %1", _taskArray];
  textLogFormat["MPF_rCREATESIMPLETASK _taskArrayObjects %1", _taskArrayObjects];
  };
  

if (isNil "BIS_missionScope") exitWith {hint "ERROR: BIS_missionScope is nil";textLogFormat["ERROR: MPF_rCREATESIMPLETASK calls fails - no BIS_missionScope logic"];};

if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName+"TaskArray", _taskArray]};
if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName+"Objects", _taskArrayObjects]};
if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName, _taskArray select 0]}; //last created task is stored in variable

//BIS_newTask = _caller createSimpleTask [_taskName];
//if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName, BIS_newTask]};
