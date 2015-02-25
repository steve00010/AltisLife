#include <macro.h>
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};
[] execVM "scripts\fn_statusBar.sqf";
switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint localize "STR_Session_SyncCheater";};
if(playerside == west) then {  //THIS IS WHAT I ADDED
	[] call life_fnc_saveGear;
};
	
[] call SOCK_fnc_updateRequest;
[] spawn life_fnc_customUniforms;


hint localize "STR_Session_SyncData";
life_session_time = true;
sleep (5 * 60);
life_session_time = false;

