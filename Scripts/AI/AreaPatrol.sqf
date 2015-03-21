_leader = _this select 0;

if ((isServer)or(isDedicated)) then 
{
	waituntil {(!(isNil "bis_fnc_init"))};
	
	sleep 5;
	
	{
		_x setSkill ["aimingaccuracy",DAP_BF_AI_AIMINGSKILL];
		_x setSkill ["aimingspeed",1];
		
	}ForEach (units(group _leader));
	
	[(group _leader), (getPos _leader), 500] call bis_fnc_taskPatrol;
};