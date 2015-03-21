scriptName "MP\data\scriptCommands\removeAction.sqf";
//Number = Unit addAction ["title", "filename", arguments, priority, showWindow, hideOnUse, "shortcut","condition"]

if (count _this < 3) exitWith {};

private["_caller","_target","_actID"];


_caller = _this select 0;
_target = _this select 1;
_actID = _this select 2;

//textLogFormat ["INTRO- Adding action: %1",_this];

//textLogFormat ["MPF - %1 %2 %3 %4 %5 %6 %7 %8 %9", _caller,_target,_text,_script,_arguments,_priority,_hideOnUse,_shortcut,_condition];

if (typename _actID == typename "") then
{//MPF-CE custom extension: if text given, it is variable name in variable space of target    
  _actID = _target getVariable _actID;  
};

if (isNil "_actID") exitWith {textLogFormat ["MPF_ ERROR: removeAction with wrong parameter '_actID' %1", _this];};

//textLogFormat ["MPF_ removeAction: %1", _actID];

if (typename _actID != typename 0) exitWith {textLogFormat ["MPF_ ERROR: removeAction with wrong typename of parameter '_actID' %1", _this];};

_target removeAction _actID;



