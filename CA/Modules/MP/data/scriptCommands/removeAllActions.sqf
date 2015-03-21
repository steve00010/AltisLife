scriptName "MP\data\scriptCommands\removeAllActions.sqf";
_caller = _this select 0;
_target = _this select 1;

_maxNo = _this select 2;

if (isNil "_maxNo") then {_maxNo = 1000;};

private ["_i"];
for [{_i=0};{_i<=_maxNo};{_i = _i + 1}] do
{
_target removeAction _i;
};