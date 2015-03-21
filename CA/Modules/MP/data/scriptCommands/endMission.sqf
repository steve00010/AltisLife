scriptName "MP\data\scriptCommands\endMission.sqf";
_caller = _this select 0;
_target = _this select 1;
_end = _this select 2;

//campaign only :: check if the mission isn't being terminated after an epic fail
if (!(isNil "BIS_cooper") && !(isNil "BIS_sykes") && !(isNil "BIS_rodriguez") && !(isNil "BIS_ohara") && !(isNil {BIS_missionScope getVariable "failEnding"})) exitWith {};

enableTeamSwitch FALSE;

_blackout = TRUE;
if (count _this > 3) then {_blackout = (_this select 3)};

[_end, _blackout] spawn {
	if (_this select 1) then {
		sleep 2;
		titleText ["", "BLACK OUT", 2]; //titleText for WF compatibility
		2 fadeSound 0;
		2 fadeMusic 0;
		sleep 2
	};
	endMission (_this select 0);
	forceEnd
}