scriptName "MP\data\scriptCommands\createTaskSet.sqf";
private ["_caller","_target","_taskName","_group","_taskArray", "_newTask", "_taskObjects"];

_caller = _this select 0;
_target = _this select 1;
_taskName = _this select 2;

// DRAM: Added support for manually specifying which units are assigned the task, as opposed to always relying on the group.
//       This is because in certain missions the group members are adjusted, thus resulting in an error.

_group = grpNull;
_taskObjects = [];

if (typeName _target == "ARRAY") then
{
	_taskObjects = _this select 1;
}
else
{
	_group = group _target;
	_taskObjects = units _group;
	if (isNil "_group") exitWith {};
};

if (!isNil "BIS_DEBUG_MPF") then 
{
	textLogFormat["MPF_rCREATETASKSET _this %1", _this];
};
	
_taskArray = [];
_taskArrayObjects = []; //objects that has this task assigned
{
  _newTask = _x createSimpleTask [_taskName];       
  _taskArray = _taskArray + [_newTask];
  _taskArrayObjects = _taskArrayObjects + [_x];      
} foreach _taskObjects;

if (!isNil "BIS_DEBUG_MPF") then 
{
  textLogFormat["MPF_rCREATETASKSET _taskArray %1", _taskArray];
  textLogFormat["MPF_rCREATETASKSET _taskArrayObjects %1", _taskArrayObjects];
};
  

if (isNil {BIS_missionScope}) exitWith {hint "ERROR: MPF_rCREATETASKSET calls fails - BIS_missionScope is nil";textLogFormat["ERROR: MPF_rCREATETASKSET calls fails - no BIS_missionScope logic"];};
  
if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName+"TaskArray", _taskArray]};
if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName+"Objects", _taskArrayObjects]};
if (alive BIS_missionScope) then {BIS_missionScope setVariable [_taskName, _taskArray select 0]}; //last created task is stored in variable
if (alive BIS_missionScope && isNil {BIS_missionScope getVariable _taskName+"TaskState"}) then {BIS_missionScope setVariable [_taskName+"TaskState", "Created", TRUE]}; //setting the default task state


	//set the task state right here
  {    
    _x setTaskState (BIS_missionScope getVariable _taskName+"TaskState");
  } foreach _taskArray;

if (count _this < 4) exitWith {};
_textDescriptionArray = _this select 3;

{
	if (typeName (_textDescriptionArray select 0) == "CODE") then {
		_x setSimpleTaskDescription [call (_textDescriptionArray select 0), call (_textDescriptionArray select 1), call (_textDescriptionArray select 2)];
	} else {
		_x setSimpleTaskDescription _textDescriptionArray;
	};
} foreach _taskArray;
  
  //{if (isPlayer _x) then {_nic = [objNull, _x, "loc", rTASKHINT, _taskArray select ((units _group) find _x), "created"] call RE}} forEach units _group;
  {if (isPlayer _x && local _x) then {[objNull, objNull, _taskArray select ((_taskObjects) find _x), "created"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf")}} forEach _taskObjects;
  
if (count _this < 5) exitWith {};
_destination = _this select 4;

if (typeName _destination == "ARRAY") then {
  {    
    _x setSimpleTaskDestination _destination;
  } foreach _taskArray;
};


if (count _this < 6) exitWith {};
_setAsCurrent = FALSE;
if ((typeName (_this select 5)) == (typeName TRUE)) then {_setAsCurrent = _this select 5};
if ((typeName (_this select 5)) == (typeName "")) then {BIS_missionScope setVariable [format ["%1AIWPType", _taskName], _this select 5]};

if (count _this > 6) then {
	BIS_missionScope setVariable [format ["%1AIWPCode", _taskName], _this select 6];
};

if (not _setAsCurrent) exitWith {};

{
  private["_who"];
  _who = _x;
  _set = TRUE;

  private["_i"];
  _i=0;
  {    
    if (_who == (_taskArrayObjects select _i)) then
    {
    _who setCurrentTask _x; 
    {if (isPlayer _who && local _who && _set && !(taskState (_taskArray select ((_taskArrayObjects) find _x)) in ["Succeeded", "Failed"])) then {_set = FALSE; 
      //_nic = [objNull, _who, "loc", rTASKHINT, _taskArray select ((_taskArrayObjects) find _who), "current"] call RE
      
      //TODO, use this: (instead of RE call)
      //spawned delay used to ensure that "New Task" hint appears prior to "New Current Task"
      [_taskArray, _taskArrayObjects, _who] spawn {
      	sleep 1;
      	[objNull, objNull, (_this select 0) select ((_this select 1) find (_this select 2)), "current"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf");
      }
      
      }} forEach _taskArrayObjects;
    };            
    _i = _i + 1;
  } foreach _taskArray; 
  
  //if (isPlayer _who && local _who) then {[objNull, objNull, _taskArray select ((units _group) find _who), "current"] execVM (BIS_PathMPscriptCommands + rTASKHINT + ".sqf")};
  _set = TRUE;
    
} foreach _taskObjects;

