_unit = _this select 0;
_dragger = _this select 1;

[nil,nil, rSPAWN,[_unit,_dragger],
{
	
if (isServer) then 
{
	if (alive (_this select 1)) then 
	{
		(_this select 0) setVariable ["DAP_DRAGGED_STATE",true,true];
		(_this select 1) setVariable ["DAP_DRAGGER_STATE",true,true];
		(_this select 1) setVariable ["DAP_WOUNDED_STATE",1,true];
		
		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;

		_animState = animationState (_this select 1);
	
		_animStateChars = toArray _animState;
		_animType = toString [_animStateChars select 5,_animStateChars select 6,_animStateChars select 7];
		_animWeaponType = toString [_animStateChars select 17,_animStateChars select 18,_animStateChars select 19];
								
		if (_animType == "pne") then 
		{
		sleep 0.5;
				
		(_this select 0) setVariable ["BIS_BC_dragged",true,true];
		(_this select 0) setVariable ["BIS_BC_dragger",true,true];
		(_this select 1) setVariable ["DAP_BC_dragger_stand",false,true];
		
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			DAP_AIFAS_DRAG_KeyBlock = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
			DONBKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_AIFAS_DRAG_KeyBlock"];
			
		}] call RE;
		
		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;
		
		[(_this select 0), (_this select 1), [-0.5,1.5,0],180] execVM "DAPMAN\Scripts\Wounded\Attach.sqf";
		
		private ["_movestate","_lifestate"];
		_movestate = 0;
		
		_lifestate = 0;
		if (alive (_this select 0)) then {_lifestate = 1;};
		
		While {((alive (_this select 1))and(_movestate <2))} do
		{
			if ((str(velocity(_this select 1)))!="[0,0,0]") then {_movestate = 1;};		
			if (((str(velocity(_this select 1)))=="[0,0,0]")and(_movestate == 1)) then {_movestate = 2;};
						
			if ((!(alive (_this select 0)))and(_lifestate==1)) then {_movestate = 2;};	
			
			_animState = animationState (_this select 1);
	
			_animStateChars = toArray _animState;
			_animType = toString [_animStateChars select 5,_animStateChars select 6,_animStateChars select 7];
			_animWeaponType = toString [_animStateChars select 17,_animStateChars select 18,_animStateChars select 19];
			
			_state = ((_this select 1) getVariable "DAP_BC_dragger_stand");
			if ((_state)or(_animType != "pne")or(!(alive (_this select 1)))or(isNull(_this select 0))) then {_movestate = 2;};

			sleep 0.5;
		}; 
		
		detach (_this select 0);
		
		if (!(isNull(_this select 0))) then 
		{
			(_this select 0) setVariable ["BIS_BC_dragged",false,true];
			(_this select 0) setVariable ["BIS_BC_dragger",false,true];
		};
		
		(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
		(_this select 1) setVariable ["DAP_DRAGGER_STATE",false,true];
		(_this select 1) setVariable ["DAP_WOUNDED_STATE",nil,true];
	
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			(findDisplay 46) displayRemoveEventHandler ["keyDown",DONBKP];
			
		}] call RE;
				
		}
		else
		{
		[nil,(_this select 1), rPLAYMOVENOW,"AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2"] call RE;
		
		waitUntil {(((animationState (_this select 1)) != "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2")or(!(alive (_this select 1))))};
	
		sleep 0.5;
				
		(_this select 0) setVariable ["BIS_BC_dragged",true,true];
		(_this select 0) setVariable ["BIS_BC_dragger",true,true];
		(_this select 1) setVariable ["DAP_BC_dragger_stand",true,true];
		
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			DAP_AIFAS_DRAG_KeyBlock = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
			DONBKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_AIFAS_DRAG_KeyBlock"];
			
		}] call RE;

		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMrunSnonWnonDb_grab"] call RE;
		
		[(_this select 0), (_this select 1), [0.175,0.97,0],180] execVM "DAPMAN\Scripts\Wounded\Attach.sqf";
		
		waitUntil {(((animationState (_this select 1)) == "acinpknlmstpsraswrfldnon")or((animationState (_this select 1)) == "acinpknlmwlksraswrfldb")or(!(alive (_this select 1)))or(isNull(_this select 0)))};
		waitUntil {((((animationState (_this select 1)) != "acinpknlmstpsraswrfldnon")and((animationState (_this select 1)) != "acinpknlmwlksraswrfldb"))or(!(alive (_this select 1)))or(isNull(_this select 0)))};
		
		detach (_this select 0);
		
		if (!(isNull(_this select 0))) then 
		{
			[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMrunSnonWnonDb_death"] call RE;
			
			(_this select 0) setVariable ["BIS_BC_dragged",false,true];
			(_this select 0) setVariable ["BIS_BC_dragger",false,true];
		}
		else
		{
			[nil,(_this select 1), rPLAYMOVENOW, "AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] call RE;
		};
			
		(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
		(_this select 1) setVariable ["DAP_DRAGGER_STATE",false,true];
		(_this select 1) setVariable ["DAP_WOUNDED_STATE",nil,true];
		
		sleep 1.5;
		
		if (!(isNull(_this select 0))) then 
		{
			[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;
		};
		
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			(findDisplay 46) displayRemoveEventHandler ["keyDown",DONBKP];
			
		}] call RE;
		
		};
		
		(_this select 1) setVariable ["DAP_BC_dragger_stand",nil,true];
	};
};

}] call RE;
