scriptName "MP\data\scriptCommands\skiptime.sqf";
_hours = _this select 2;

//if (debug > 0) then {player globalChat format["skipTime (%1 hours) start T: %2",_hours,time];};

textLogFormat["VD18- hours %2 _this %1",_this,_hours];
skipTime _hours;

//if (debug > 0) then {player globalChat format["skipTime (%1 hours) end T: %2",_hours,time];};