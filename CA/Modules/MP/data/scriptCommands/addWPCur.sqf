scriptName "MP\data\scriptCommands\addWPCur.sqf";
private["_wp","_caller","_target","_pos","_rad"];

_caller = _this select 0;
_target = _this select 1;
_pos = _this select 2;
_rad = _this select 3;


_wp = (group _target) addWaypoint[_pos, _rad];
_wp showWaypoint "ALWAYS";
(group _target) setCurrentWaypoint _wp;

_wp setWaypointPosition [waypointPosition _wp, 0]; //hack - WP need to move, then unit wakes up		
