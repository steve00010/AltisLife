#include "Settings\CombatArea.hpp"
#include "Settings\MissionSettings.hpp"

#include "Settings\AddonsConfigurator.hpp"

[] execVM "ca\Modules\MP\data\scripts\MPFramework.sqf";

if (isMultiplayer) then 
{
	MAXTIME = paramsArray select 0;
	PublicVariable "MAXTIME";
	CACHESNUMBER = paramsArray select 1;
	PublicVariable "CACHESNUMBER";
	
	DAP_BF_PLAYERSMARKERS = paramsArray select 4;
	PublicVariable "DAP_BF_PLAYERSMARKERS";
	
	DAP_BF_AI_ENABLED = paramsArray select 5;
	PublicVariable "DAP_BF_AI_ENABLED";
	DAP_BF_AI_UNLIMITEDAMMO = paramsArray select 6;
	PublicVariable "DAP_BF_AI_UNLIMITEDAMMO";
	
	setViewDistance (paramsArray select 2);
	setTerrainGrid (paramsArray select 3);
	
	if ((isServer)or(isDedicated)) then
	{
		_CurrentDate = date;
		setDate [(_CurrentDate select 0), (_CurrentDate select 1), (_CurrentDate select 2), (paramsArray select 8), 0];
	};
	
	DAP_BF_WEATHER = paramsArray select 9;
	PublicVariable "DAP_BF_WEATHER";
	
	if (!(isDedicated)) then 
	{
		[DAP_BF_WEATHER] execVM "Scripts\SP\Common\Weather.sqf";
	};
}
Else
{
	CACHESNUMBER=15;
	PublicVariable "CACHESNUMBER";
	MAXTIME=43200;
	PublicVariable "MAXTIME";
	
	[player] execVM "Scripts\SP\MPSquad.sqf";
	[(floor(random 5))] execVM "Scripts\SP\Common\Weather.sqf";
};

CurrentSoundVolume = SoundVolume;
CurrentRadioVolume = RadioVolume;

0 FadeSound 0;
0 FadeRadio 0;

"respawn_west" setMarkerAlpha 0;

if ((isServer)or(isDedicated)) then
{
	if (MAXTIME>0) then {[MAXTIME]execVM "Scripts\UI\Timer.sqf";};
	DAP_BF_MISSIONEND=0;
	PublicVariable "DAP_BF_MISSIONEND";
	EASTWIN = 0;
	PublicVariable "EASTWIN";
	WESTWIN = 0;
	PublicVariable "WESTWIN";
	MISSIONDRAW=0;
	PublicVariable "MISSIONDRAW";
	
	DAP_CACHES_SETUP_DONE = 0;
	PublicVariable "DAP_CACHES_SETUP_DONE";
	
	CACHES execVM "Scripts\SP\Insurgents\IEDS\IEDSetup.sqf";
	
	[]execVM "Scripts\SP\Insurgents\Caches\CachesSetup.sqf";
	[]execVM "Scripts\SP\RallyPointsManager.sqf";
	[]execVM "eos\OpenMe.sqf";
	[]execVM "Scripts\Support\UAV\UAVDelay.sqf";
};

if (!(isDedicated)) then
{
	5 CutText ["","BLACK FADED",1];

	finishMissionInit;

	dap_mission_loaded = 0;
	onPreloadStarted 
	{ 
		dap_mission_loaded = 0;
	}; 
	onPreloadFinished 
	{ 
		dap_mission_loaded = 1;
	};

	waitUntil {dap_mission_loaded == 1};
	
	[[player]] execVM "DAPMAN\Init.sqf";
	
	if ((name player) in GLOBALBANLIST) then 
	{
		player setVariable ["DAP_PUNISHMENT",100,true];
		[player] execVM "Scripts\SP\Punishment\Punishment.sqf"; 
	}
	else
	{
		player setVariable ["DAP_PUNISHMENT",nil,true];
		player setVariable ["DAP_PUNISHMENT_COUNTER",nil,true];
		player setVariable ["DAP_PUNISHMENT_PROGRESS",nil,true];
	
		if (DAP_CACHES_SETUP_DONE ==1) then {[] execVM "Scripts\UI\AreaMarkers.sqf";};
	
		if (isMultiplayer) then 
		{
			player addMPEventHandler ["mpkilled", {_this execVM "Scripts\SP\Punishment\KilledHandler.sqf";}];
		};
		
		if ((side group player)==WEST) then 
		{
			[] execVM "Scripts\UI\HC\hcam_init.sqf";
			[player] execVM "Scripts\SP\WEST\Soldier.sqf";
			
			if (isMultiplayer) then 
			{
				player addEventHandler ["Respawn",
				{
					if (local (_this select 0)) then 
					{
						[(_this select 0)] execVM "Scripts\SP\WEST\Soldier.sqf";
					};
				}];
			};
		}
		else
		{
			"HQ" setMarkerAlphaLocal 0;
			"SUPPLY" setMarkerAlphaLocal 0;
			"VEHICLES" setMarkerAlphaLocal 0;
			
			[player] execVM "Scripts\SP\Insurgents\Insurgent.sqf";
		
			if (isMultiplayer) then 
			{
				player addEventHandler ["Respawn",
				{
					if (local (_this select 0)) then 
					{
						"HQ" setMarkerAlphaLocal 0;
						"SUPPLY" setMarkerAlphaLocal 0;
						"VEHICLES" setMarkerAlphaLocal 0;
						
						[(_this select 0)] execVM "Scripts\SP\Insurgents\Insurgent.sqf";
					};
				}];
			};
		
			{

				_x addAction [(localize "STR_ACT_DEFENDCACHE"),"Scripts\SP\Insurgents\Caches\DefendCache.sqf",[],0,false,true];
				[_x,0] execVM "Scripts\Support\Backpacks.sqf";
			
				_x allowDammage false;
			
			}ForEach TARGETS;
		};	
	
		[] execVM "Briefing.sqf";
		[] execVM "Scripts\UI\Intro.sqf";
		[] execVM "scripts\earplug\earpluginit.sqf";
		[] execVM "scripts\welcome.sqf";
		[] execVM "scripts\zlt_fastrope.sqf";
		[] execVM "scripts\UI\fn_statusBar.sqf";
		if (isMultiplayer) then 
		{
			player addEventHandler ["Respawn", 
			{
				[(_this select 1)] execVM "Scripts\ClearBattlefield.sqf";
			}];
		};

		sleep 2;

		5 CutText ["","BLACK IN",5];

		5 FadeSound CurrentSoundVolume;
		5 FadeRadio CurrentRadioVolume;

		if (isMultiplayer) then 
		{
			setPlayerRespawnTime (paramsArray select 7);
		};
		
		DAP_BF_MAPSTATE = 0;
		if (MAXTIME>0) then {[MAXTIME]execVM "Scripts\UI\TimeCounter.sqf";};
		[] execVM "Scripts\UI\UISetup.sqf";
	};
};

DAP_BF_PLAYERSQUAD = [];
enableSaving [false, false];