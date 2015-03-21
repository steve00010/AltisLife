scriptName "MP\data\scriptCommands\hintC.sqf";
_caller = _this select 0;
_target = _this select 1;
_text = _this select 2;


textLogFormat ["VD17v2- Hint: %1",_this];

if (count _this < 3) exitWith {};

/*
_data = [];
_data = _data;
for [{_x=2},{_x<count _this},{_x=_x+1}] do 
{_data = _data + [_this select _x]};
*/


hintC _text;


