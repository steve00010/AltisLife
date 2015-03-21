_targets = _this select 0;

if ((isServer)or(isDedicated)) then 
{

	While {true} do 
	{
	
		if ((count _targets) > 0) then 
		{
			{
	
				if (!(alive(_x))) then 
				{
					_targets = _targets - [_x];
					TARGETS = TARGETS - [_x];
					PublicVariable "TARGETS";
				};
					
		
			}ForEach _targets
		}
		else
		{
			DAP_BF_MISSIONEND=1;
			PublicVariable "DAP_BF_MISSIONEND";
		};
	
		sleep 5;
	};
};