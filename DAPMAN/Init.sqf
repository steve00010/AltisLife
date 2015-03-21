_array = (_this select 0);

sleep 1;
waitUntil{!(isNil "BIS_MPF_InitDone")};

[nil, nil, rSPAWN, [_array],
{
	private ["_state"];
	_unitsarray = (_this select 0);
	
	if ((count(_unitsarray))>0) then 
	{
		if (isServer) then
		{
			DAP_AIFAS=1;
			PublicVariable "DAP_AIFAS";
			{
				if (_x isKindOf "CAManBase") then 
				{
					_state = _x getVariable "DAP_AIFAS_ASSIGNED";
	
					if (isNil("_state")) then 
					{
						if (!(isMultiplayer)) then {_x addEventHandler ["hit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];};
						if (isMultiplayer) then 
						{
							_x addMPEventHandler ["MPHit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];
							_x addMPEventHandler ["MPRespawn",
							{
								private ["_ismed"];
								
								(_this select 0) setCaptive false;
								(_this select 0) setVariable ["DAP_WOUNDED_STATE",0,true];
								
								(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
								(_this select 0) setVariable ["DAP_DRAGGER_STATE",false,true];
								
								[nil, nil,"per",rSPAWN, [(_this select 0)],
								{
									_man = _this select 0;
									_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
									_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","((((damage _target)> 0.5))and(alive _target)and(_target != player)and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
								
								}] call RE;
							}];
						};
						
						_x setVariable ["DAP_Drag",0,true];
						
						_x setVariable ["DAP_DRAGGED_STATE",false,true];
						_x setVariable ["DAP_DRAGGER_STATE",false,true];
						
						[nil, nil,"per",rSPAWN, [_x],
						{
							_man = _this select 0;
							_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
							_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","((((damage _target)> 0.5))and(alive _target)and(_target != player)and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
						
						}] call RE;				
						
						_x setVariable ["DAP_AIFAS_ASSIGNED",1,true];
					};
				};
		
				if (_x != vehicle _x) then 
				{
					_crew = crew vehicle _x;
					{ if (_x isKindOf "CAManBase") then 
						{
							_state = _x getVariable "DAP_AIFAS_ASSIGNED";
							if (isNil("_state")) then 
							{
								if (!(isMultiplayer)) then {_x addEventHandler ["hit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];};
								if (isMultiplayer) then 
								{
									_x addMPEventHandler ["MPHit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];
									_x addMPEventHandler ["MPRespawn", 
									{
										private ["_ismed"];
										
										(_this select 0) setCaptive false;
										(_this select 0) setVariable ["DAP_WOUNDED_STATE",0,true];
								
										(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
										(_this select 0) setVariable ["DAP_DRAGGER_STATE",false,true];
										
										[nil, nil,"per",rSPAWN, [(_this select 0)],
										{
											_man = _this select 0;
											_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
											_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","((((damage _target)> 0.5))and(alive _target)and(_target != player)and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
															
										}] call RE;
									}];
								};
								
								_x setVariable ["DAP_Drag",0,true];
								
								_x setVariable ["DAP_DRAGGED_STATE",false,true];
								_x setVariable ["DAP_DRAGGER_STATE",false,true];
							
								[nil, nil,"per",rSPAWN, [_x],
								{
									_man = _this select 0;
									_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
									_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","((((damage _target)> 0.5))and(alive _target)and(_target != player)and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
								
								}] call RE;
									
								_x setVariable ["DAP_AIFAS_ASSIGNED",1,true];
							};
						};
						
					}ForEach _crew;
				};
	
			} forEach _unitsarray;	
		};
	};
	
}] call RE;