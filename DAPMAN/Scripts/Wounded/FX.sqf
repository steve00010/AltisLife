_man = _this select 0;

[nil,_man,"loc", rSPAWN,[_man],
{
	private ["_delay","_wutime","_wustate","_critical","_criticalstate","_soundvolume","_ColorCorrections","_DynamicBlur"];
	
	_unit = _this select 0;	
	
	_critical = 0;
	_criticalstate = 0;
	
	_wutime = (30+(random 15));
	
	_state = _unit getVariable "DAP_BLOODFX_STATE";
	if ((isNil("_state"))and(alive _unit)) then 
	{
		_unit setVariable ["DAP_BLOODFX_STATE",1,true];
		
		DAP_FirstAid_KeyCheck = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
		_BKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_FirstAid_KeyCheck"];
		
		_soundvolume = 0.75;
		_radiovolume = 0.75;
		
		showHUD false;
		
		while {(player getVariable "DAP_Wound"==1 and (alive _unit) and (_unit == player))} do 
		{
			if ((damage _unit) < 0.7) then 
			{
				1 fadeSound 0.025;
				1 fadeRadio 0.25;
				
				251 cutRsc ["DAP_WOUNDED_BLOODSPLASH","PLAIN",0];
			}
			else
			{
				if (_criticalstate == 0) then 
				{
					sleep 1;
				
					10 fadeSound 0;
					10 fadeRadio 0;
				
					if (_critical == 0) then
					{
						_critical = 1;
						256 cutText [" ","BLACK OUT",10];
					};
											
					for "_i" from 1 to 10 do 
					{
						_ColorCorrections = ppEffectCreate ["colorCorrections", 1554];
						_DynamicBlur = ppEffectCreate ["dynamicBlur", 454];
	
						_ColorCorrections ppEffectEnable true;
						_DynamicBlur ppEffectEnable true;
		
						_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
						_ColorCorrections ppEffectCommit 0.01;
	
						_DynamicBlur ppEffectAdjust [3];
						_DynamicBlur ppEffectCommit 0.01;
							
						251 cutRsc ["DAP_WOUNDED_BLOODSPLASH","PLAIN",0];
						PlaySound "DAP_HEARTBEAT";
						
						sleep 1;
					};
					
					_criticalstate = 1;
				}
				else
				{
					_wustate = _unit getVariable "DAP_HEALTH_STATE";
					if (isNil("_wustate")) then 
					{
						_wustate=0;
					};
					
					if ((_wutime <0)and(_wustate==0)) then 
					{
						10 fadeSound 0.025;
						10 fadeRadio 0.25;
				
						256 cutText [" ","BLACK IN",10];
															
						for "_i" from 1 to 10 do 
						{
							_ColorCorrections = ppEffectCreate ["colorCorrections", 1554];
							_DynamicBlur = ppEffectCreate ["dynamicBlur", 454];
	
							_ColorCorrections ppEffectEnable true;
							_DynamicBlur ppEffectEnable true;
		
							_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
							_ColorCorrections ppEffectCommit 0.01;
	
							_DynamicBlur ppEffectAdjust [3];
							_DynamicBlur ppEffectCommit 0.01;
							
							251 cutRsc ["DAP_WOUNDED_BLOODSPLASH","PLAIN",0];
							PlaySound "DAP_HEARTBEAT";
							
							sleep 1;
						};
					
						10 fadeSound 0;
						10 fadeRadio 0;
				
						256 cutText [" ","BLACK OUT",10];
					
						for "_i" from 1 to 10 do 
						{
							_ColorCorrections = ppEffectCreate ["colorCorrections", 1554];
							_DynamicBlur = ppEffectCreate ["dynamicBlur", 454];
	
							_ColorCorrections ppEffectEnable true;
							_DynamicBlur ppEffectEnable true;
		
							_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
							_ColorCorrections ppEffectCommit 0.01;
	
							_DynamicBlur ppEffectAdjust [3];
							_DynamicBlur ppEffectCommit 0.01;
							
							251 cutRsc ["DAP_WOUNDED_BLOODSPLASH","PLAIN",0];
							PlaySound "DAP_HEARTBEAT";
							
							sleep 1;
						};
						
						_wutime = (30+(random 15));
					};
					
					_wutime = _wutime - 1;
				};
			};
						
			_ColorCorrections = ppEffectCreate ["colorCorrections", 1554];
			_DynamicBlur = ppEffectCreate ["dynamicBlur", 454];
	
			_ColorCorrections ppEffectEnable true;
			_DynamicBlur ppEffectEnable true;
		
			_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
			_ColorCorrections ppEffectCommit 0.01;
	
			_DynamicBlur ppEffectAdjust [3];
			_DynamicBlur ppEffectCommit 0.01;
				
			sleep 1;
			if (_critical == 0) then {PlaySound ["DAP_HEARTBEAT",true];};
		};
				
		if (isPlayer _unit) then 
		{
			if (alive player) then 
			{
				if (_critical == 0) then 
				{
					256 cutText [" ","BLACK OUT",5];

					_delay = (4 + random 1) * acctime;  
					sleep _delay;
			
					ppEffectDestroy _ColorCorrections;
					ppEffectDestroy _DynamicBlur;
				
					5 fadeSound _soundvolume;
					5 fadeRadio _radiovolume;
				
					256 cutText [" ","BLACK IN",5];
				}
				else
				{
					ppEffectDestroy _ColorCorrections;
					ppEffectDestroy _DynamicBlur;
					
					sleep 1;
					
					10 fadeSound _soundvolume;
					10 fadeRadio _radiovolume;
				
					256 cutText [" ","BLACK IN",10];
				};
			}
			else
			{
				ppEffectDestroy _ColorCorrections;
				ppEffectDestroy _DynamicBlur;
				
				5 fadeSound _soundvolume;
				5 fadeRadio _radiovolume;
				
				256 cutText [" ","BLACK IN",5];
			};
		}
		else
		{
			ppEffectDestroy _ColorCorrections;
			ppEffectDestroy _DynamicBlur;
			
			0 fadeSound _soundvolume;
			0 fadeRadio _radiovolume;
			
			256 cutText [" ","BLACK IN",5];
		};
		
		showHUD true;
		(findDisplay 46) displayRemoveEventHandler ["keyDown",_BKP];

		_unit setVariable ["DAP_BLOODFX_STATE",nil,true];
	};
	
}] call RE;