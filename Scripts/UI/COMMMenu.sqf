_unit = _this select 0;

if (local player) then 
{
	if (DAP_BF_AI_ENABLED==1) then 
	{
		if (player == leader (group player)) then 
		{
			BIS_fnc_addCommMenuItem_menu = 
			[
			[localize "STR_BF_SUPPORTMENU",false],
			[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""],
			[localize "STR_SL_TRN", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportRequest.sqf"""] ], "1", "CursorOnGround", ""]
			];
		}
		else
		{
			BIS_fnc_addCommMenuItem_menu = 
			[
			[localize "STR_BF_SUPPORTMENU",false],
			[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""]
			];
		};
	
		 
		if (commandingmenu == "#User:BIS_fnc_addCommMenuItem_menu") then {showCommandingMenu "#User:BIS_fnc_addCommMenuItem_menu";};
				
		While {true} do 
		{
			WaitUntil {sleep 1;(player == leader (group player));};
			
			if (player == leader (group player)) then 
			{
				BIS_fnc_addCommMenuItem_menu = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""],
				[localize "STR_SL_TRN", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportRequest.sqf"""] ], "1", "CursorOnGround", ""]
				];
			}
			else
			{
				BIS_fnc_addCommMenuItem_menu = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""]
				];
			};	
			 
			if (commandingmenu == "#User:BIS_fnc_addCommMenuItem_menu") then {showCommandingMenu "#User:BIS_fnc_addCommMenuItem_menu";};
	
			WaitUntil {sleep 1;(player != leader (group player));};
			
			if (player == leader (group player)) then 
			{
				BIS_fnc_addCommMenuItem_menu = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""],
				[localize "STR_SL_TRN", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportRequest.sqf"""] ], "1", "CursorOnGround", ""]
				];
			}
			else
			{
				BIS_fnc_addCommMenuItem_menu = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", ""]
				];
			};	
		 
			if (commandingmenu == "#User:BIS_fnc_addCommMenuItem_menu") then {showCommandingMenu "#User:BIS_fnc_addCommMenuItem_menu";};
		};
	};
};