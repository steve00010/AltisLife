scriptName "MP\data\scriptCommands\getVariable.sqf";
_caller = _this select 0;
_target = _this select 1; 
_var = _this select 2;



textLogFormat["VD18- %1 var: %2",_this,_var,_val];
_setter getVariable _var;
 