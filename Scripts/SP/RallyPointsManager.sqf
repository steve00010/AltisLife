sleep 5;

if (isMultiplayer) then 
{
	while {true} do 
	{
		if ((count DAP_ALL_RALLYPOINTS) >0) then
		{
			{
				_data = _x getVariable "DAP_WEST_RALLYPOINTOWNER";
				_owner = _data select 0;
				_group = _data select 1;
			
				if ((isNull _owner) or (!(isPlayer _owner))) then 
				{
					if (!(isNull _group)) then 
					{
						if ((count (units _group))>0) then 
						{
							if (alive(leader _group)) then 
							{
								_x setVariable ["DAP_WEST_RALLYPOINTOWNER", [(leader _group),_group],true];
								(leader _group) setVariable ["DAP_WEST_RALLYPOINT",[(leader _group),_x],true];
							};
						}
						else
						{
							DAP_ALL_RALLYPOINTS = DAP_ALL_RALLYPOINTS - [_x];
							publicVariable "DAP_ALL_RALLYPOINTS"; 
							deleteVehicle _x;
						};				
					}
					else 
					{
						DAP_ALL_RALLYPOINTS = DAP_ALL_RALLYPOINTS - [_x];
						publicVariable "DAP_ALL_RALLYPOINTS"; 
						deleteVehicle _x;
					};
				}
				else
				{
					if  (_owner != (leader(group _owner))) then 
					{
						if ((count (units _group))>0) then 
						{
							if (alive(leader _group)) then 
							{
								_x setVariable ["DAP_WEST_RALLYPOINTOWNER", [(leader _group),_group],true];
								(leader _group) setVariable ["DAP_WEST_RALLYPOINT",[(leader _group),_x],true];
							};
						};
					};
				};
					
			}ForEach DAP_ALL_RALLYPOINTS;
		};
		sleep 3;
	};
};