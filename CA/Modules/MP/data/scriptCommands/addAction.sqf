scriptName "MP\data\scriptCommands\addAction.sqf";
//Number = Unit addAction ["title", "filename", arguments, priority, showWindow, hideOnUse, "shortcut","condition"]


//private["_caller","_target","_text","_script","_arguments","_priority","_hideOnUse","_shortcut","_condition"];
private["_caller","_target","_text","_script","_arguments","_priority","_showWindow","_hideOnUse","_shortcut","_condition"];
private["_varName_actNo"];

_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;
_script = _this select 3;
if (count _this > 4) then {_arguments = _this select 4};
if (count _this > 5) then {_priority = _this select 5};
if (count _this > 6) then {_showWindow = _this select 6};
if (count _this > 7) then {_hideOnUse = _this select 7};
if (count _this > 8) then {_shortcut = _this select 8};
if (count _this > 9) then {_condition = _this select 9};


//one extra parameter to addAction in MPF! - name of variable for storing act number (eg.: "AIS_vehicleAct")
if (count _this >10) then {_varName_actNo = (_this select 10)};



//textLogFormat ["INTRO- Adding action: %1",_this];
//textLogFormat ["MPF - %1 %2 %3 %4 %5 %6 %7 %8 %9", _caller,_target,_text,_script,_arguments,_priority,_showWindow,_hideOnUse,_shortcut,_condition];

if (count _this < 4) exitWith {};


if (count _this == 4) exitWith {_target addAction [_text,_script]};

if (isNil "_arguments") then {_arguments = []};
if (isNil "_priority") then {_priority = 100};
if (isNil "_showWindow") then {_showWindow = TRUE};
if (isNil "_hideOnUse") then {_hideOnUse = TRUE};
if (isNil "_shortcut") then {_shortcut = ""};
if (isNil "_condition") then {_condition = "TRUE"};


private ["_actNo"];
_actNo = _target addAction [_text,_script,_arguments,_priority,_showWindow,_hideOnUse,_shortcut,_condition];

if (!isNil "_varName_actNo") then 
{
  if (typename _varName_actNo == typename "") then
  {//store action number into given variable name    
    _target setVariable [_varName_actNo, _actNo, false]; //local only!
  }
  else
  {
  textLogFormat ["MPF_ ERROR: addAction with wrong typename of parameter '_varName_actNo' %1", _this];
  };
};