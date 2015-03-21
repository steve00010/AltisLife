_uav = _this select 0;
_man = _this select 1;

if ((isServer)or(isDedicated)) then 
{
	WaitUntil {((DAP_BF_WEST_UAV==0)or(!(isPlayer _man)));};

	[[WEST, "Airbase"], nil, rSIDERADIO, "UAVEND_WEST"] call RE;

	[_uav] execVM "Scripts\Support\UAV\UAVDELETE.sqf";

	_uavdelay = DAP_BF_UAVDELAY;

	sleep _uavdelay;

	DAP_BF_WEST_UAV=1;
	publicVariable "DAP_BF_WEST_UAV";
	
	[[WEST, "Airbase"], nil, rSIDERADIO, "UAVREADY_WEST"] call RE;
};