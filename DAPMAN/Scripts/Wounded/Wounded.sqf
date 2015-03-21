private ["_wstate","_dstate"];

_unit = _this select 0;
_damage = _this select 2;

if (local _unit) then 
{
	if (_damage >= 0.25) then 
	{
		if(isPlayer _unit) then {[_unit] execVM "DAPMAN\Scripts\Wounded\HITFX.sqf";};
	};
	
	if (alive _unit) then 
	{
		if ((damage _unit)>= 0.25) then 
		{
			if (!(dialog)) then 
			{
				[nil, nil, rSPAWN, [_unit],
				{
					if (isServer) then 
					{
						[(_this select 0)] exec "DAPMAN\Scripts\Wounded\WoundedMain.sqs";
					};
							
				}] call RE;
			};
		};
	};
};

