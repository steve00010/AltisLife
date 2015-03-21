scriptName "MP\data\scriptCommands\setVariable.sqf";
_caller = _this select 0;
_setter = _this select 1; 
_var = _this select 2;
_val = _this select 3;


textLogFormat["VD18- %1 var: %2 val: %3",_this,_var,_val];
_setter setVariable [_var, _val];
 