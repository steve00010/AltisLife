_uav = _this select 0;
_man = _this select 1;

[nil, nil, rSPAWN, [_uav, _man], 
{
	_vehicle = _this select 0;
	_unit = _this select 1;
					
	if ((isServer)or(isDedicated)) then 
	{
		[_vehicle,_unit] execVM "Scripts\Support\UAV\UAVMANAGER.sqf";
	};
		
}] call RE;
