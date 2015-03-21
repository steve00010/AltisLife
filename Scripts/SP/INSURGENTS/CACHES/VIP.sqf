_VIP = _this select 0;

if ((isServer)or(isDedicated)) then 
{ 
	removeAllWeapons _VIP;
	
	[_VIP] execVM "Scripts\SP\Insurgents\Warlord.sqf";
	
	_VIP setSkill 0;
	_VIP setVariable ["DAP_HASINFO",1,true];
	
	WaitUntil {(vehicle _VIP != _VIP);};
	
	sleep 5;
	
	WaitUntil {((vehicle _VIP == _VIP)or(!(alive _VIP)));};
	
	if (alive _VIP) then 
	{
		sleep 3;
		
		unassignVehicle _VIP;
		doStop _VIP;
				
		[_VIP] allowGetIn false;
		
		_VIP disableAI "Move";
	
		_VIP setUnitPos "UP";
		_VIP setCaptive true;
	
		_VIP playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"; 
		
		WaitUntil {sleep 1;((animationState _VIP) == "amovpercmstpssurwnondnon")};
		
		_VIP disableAI "Anim";
	
		_VIP setVariable ["DAP_AIFAS_CANBEINTERROGATED",1,true];
	};
};