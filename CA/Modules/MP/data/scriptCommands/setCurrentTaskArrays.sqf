debugLog "RUNNING 1";

scriptName "MP\data\scriptCommands\setCurrentTaskArrays.sqf";
_caller = _this select 0;
_target = _this select 1;

//_task = _this select 2;
_taskArray = _this select 2; //array of tasks
//_taskObjects = _this select 3; //array of objects (first object has assigned first task from _tasArray)

//_target setCurrentTask _task;

//_nic = [objNull, player, rSETCURRENTTASK, BIS_missionScope getVariable "obj2",BIS_missionScope getVariable "obj2Objects"] call RE;

_taskArrayObjects = BIS_missionScope getVariable (_task+"Objects");

_group = group _target;

if (!isNil "BIS_DEBUG_MPF") then 
      {
        textLogFormat["MPF_setCurrentTaskArrays %1 group %2 tasks %3 objects %4", _target, _group, _taskArray, _taskObjects];
      };

{
  private["_who"];
  _who = _x;
  
  /*
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_setCurrentTask %2 to _x %1 ", _x,_task];
  };
  */
  
  
  //FIXME: prasarna
  private["_i"];
  _i=0;
  {
    if (!isNil "BIS_DEBUG_MPF") then 
    {
      textLogFormat["MPF_setCurrentTaskArrays (trying) %2 to _x %1 ", _who,_x];
    };  
    
    if (_who == (_taskObjects select _i)) then
    {
    _who setCurrentTask _x;
    {if (isPlayer _x && taskState (_taskArray select ((_taskArrayObjects) find _x)) != _state) then {_nic = [objNull, _x, "loc", rTASKHINT, _taskArray select ((_taskArrayObjects) find _x), "current"] call RE}} forEach _taskArrayObjects;
    
    if (!isNil "BIS_DEBUG_MPF") then 
    {
      textLogFormat["MPF_setCurrentTaskArrays %2 to _x %1 ", _who,_x];
    };  
    };
            
    _i = _i + 1;
  } foreach _taskArray; 
    
    
} foreach units _group;