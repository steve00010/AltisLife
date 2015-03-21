scriptName "MP\data\scriptCommands\failMission.sqf";
_caller = _this select 0;
_target = _this select 1;
_end = _this select 2;

enableTeamSwitch FALSE;

_blackout = TRUE;
if (count _this > 3) then {_blackout = (_this select 3)};

[_end, _blackout] spawn {
	if (_this select 1) then {
		//campaign only
		if (!(isNil "BIS_cooper") && !(isNil "BIS_sykes") && !(isNil "BIS_rodriguez") && !(isNil "BIS_ohara")) then {
			BIS_missionScope setVariable ["failEnding", TRUE];
			//murder
			if ((_this select 0) == "Loser") then {
				playMusic "Track01_Dead_Forest";
				0 fadeMusic 0.5;
				sleep 2;
			};
			//death in Razor
			if ({alive _x} count [BIS_cooper, BIS_sykes, BIS_rodriguez, BIS_ohara] < 4 || if (!(isNil "BIS_miles")) then {!(alive BIS_miles)} else {FALSE}) then {
				3 fadeMusic 0;
				sleep 3;
				playMusic "Ambient02_Vague_Shapes";
				5 fadeMusic 0.5;
				sleep 15
			};
			//all unconscious
			if ({lifeState _x == "UNCONSCIOUS"} count units group BIS_cooper == count units group BIS_cooper) then {
				sleep 15
			}
		}
	};
	setAccTime 0;
	failMission (_this select 0);
	forceEnd
}