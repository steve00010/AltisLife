private ["_target"];

_unit = _this select 1;
_id = _this select 2;

_state = 1;

_target = cursortarget;

if (isNull _target) then 
{
	_allmarks = nearestObjects [_unit,["LaserTarget"],viewdistance];
	
	if ((count _allmarks)>0) then 
	{
		_target = _allmarks select 0;
	};
};

if (!(isNull _target)) then 
{
	_targetpos = getPos _target;
	
	[_unit, nil, rSIDERADIO,"UAVREQUEST_WEST"] call RE;

	sleep 5;

	if (DAP_BF_WEST_UAV==0) then {[[WEST, "Airbase"], nil, rSIDERADIO, "UAVDENIED_WEST"] call RE; _state = 0;};
	if (DAP_BF_WEST_UAV==2) then {[[WEST, "Airbase"], nil, rSIDERADIO, "UAVDENIED_ALT_WEST"] call RE; _state = 0;};

	if (_state==1) then 
	{
		[[WEST, "Airbase"], nil, rSIDERADIO, "UAVSTART_WEST"] call RE;
		DAP_BF_WEST_UAV=2;
		publicVariable "DAP_BF_WEST_UAV";

		sleep 3;
		[[WEST, "Airbase"], nil, rSIDERADIO, "UAV_WEST"] call RE;
		
		sleep 3;
		
		[_unit,_targetpos] execVM "Scripts\Support\UAV\UAV.sqf";
	};
}
else
{
	HintSilent localize "STR_ACT_UAVNOORIENTIR";
	
	sleep 5;
	
	HintSilent "";
};

