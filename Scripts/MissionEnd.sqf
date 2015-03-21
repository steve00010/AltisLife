private ["_winner"];

	DAP_BF_MISSIONEND=1;
	PublicVariable "DAP_BF_MISSIONEND";
	
	if((count TARGETS) == 0) then {_winner = "WEST";}else{_winner = "EAST";};
	
	if (_winner == "WEST") then 
	{
		if (side group player == WEST) then 
		{
			titleText [localize "STR_MISSION_VICTORY", "PLAIN",5];
			PlayMusic "VICTORY_WEST";
		
		}
		Else
		{
			titleText [localize "STR_MISSION_DEFEAT", "PLAIN",5];
			PlayMusic "DEFEAT_EAST";
		
		};
	};
	
	if (_winner == "EAST") then 
	{
		if (side group player == RESISTANCE) then 
		{
			titleText [localize "STR_MISSION_VICTORY", "PLAIN",5];
			PlayMusic "VICTORY_EAST";
		
		}
		Else
		{
			titleText [localize "STR_MISSION_DEFEAT", "PLAIN",5];
			PlayMusic "DEFEAT_WEST";
		};
	};
		
	sleep 5;
	
	if ((isServer)or(isDedicated)) then 
	{
		if (_winner == "WEST") then {WESTWIN=1;publicVariable "WESTWIN";};
		if (_winner == "EAST") then {EASTWIN=1;publicVariable "EASTWIN";};
	};

