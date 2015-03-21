if (!(isMultiplayer)) then 
{
OnTeamSwitch 
	{
		if (!(visibleMap)) then 
		{
			((HUDDisplay select 0) displayCtrl 51001) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51002) ctrlShow false;
		};
	
		if (DAP_BF_AI_ENABLED==1) then 
		{
			if (player == leader group player) then 
			{
				_playerissl = player getVariable "DAP_BF_SQUADLEADER";
		
				if (!(isNil("_playerissl"))) then
				{
			
					BIS_fnc_addCommMenuItem_menu = 
					[
					[localize "STR_BF_SUPPORTMENU",false],
					[localize "STR_SL_TRN", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_BF_EVAC", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
					];
				};
				if (commandingmenu == "#USER:BIS_fnc_addCommMenuItem_menu") then {showCommandingMenu "#USER:BIS_fnc_addCommMenuItem_menu";};
			}
			else
			{
				BIS_fnc_addCommMenuItem_menu = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [6], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
				];
				if (commandingmenu == "#USER:BIS_fnc_addCommMenuItem_menu") then {showCommandingMenu "#USER:BIS_fnc_addCommMenuItem_menu";};	 
			};
		};
		
		{if(_x!=player) then {_x stop false;};}ForEach switchableUnits;
		
		{_x setPos [0,0,-1000]; deleteVehicle _x;}ForEach DAP_BF_PLAYERSQUAD;
		
		DAP_BF_PLAYERSQUAD = [];
	};
};

if (local player) then 
{
	[] execVM "Scripts\UI\UIManager.sqf";
	[] execVM "Scripts\UI\PlayersMarkers.sqf";

	if ((side (group player))==WEST) then 
	{
		[player] execVM "Scripts\UI\COMMMenu.sqf";
	};
	
	[player] execVM "Scripts\UI\OptionsManager.sqf";
		
	player addEventHandler ["Respawn",
	{ 
		if (local (_this select 0)) then 
		{
			[(_this select 0)] execVM "Scripts\UI\OptionsManager.sqf";
		};
	}];
};


