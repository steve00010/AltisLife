private ["_info","_duration","_punishmentcount"];

_man = _this select 0;

if ((local _man)and(_man == player)) then 
{
	player setPos (getPos INSURGENTSZEROPOINT);
	
	_punishstate = player getVariable "DAP_PUNISHMENT";

	if (!(isNil("_punishstate"))) then 
	{
		if (_punishstate >=3) then 
		{
			_punishstart = player getVariable "DAP_PUNISHMENT_PROGRESS";
			
			if (isNil("_punishstart")) then 
			{
				player setVariable ["DAP_PUNISHMENT_PROGRESS",1,true];
										
				if (_punishstate <10) then 
				{
					if (_punishstate ==3) then 
					{
						_info=(localize "STR_PUNISHMENT_INFO_SUICIDE");
						_duration = 300;
					};
				
					if (_punishstate ==5) then 
					{
						_info=(localize "STR_PUNISHMENT_INFO_VEHICLESTEAL");
						_duration = 300;
					};
				}
				else
				{
					if (_punishstate <100) then 
					{
						if (_punishstate ==10) then 
						{
							_info=(localize "STR_PUNISHMENT_INFO_WARLORDKILL");
							_duration = 3600;
					
							if ((name player) in GLOBALBANLIST) then 
							{
								_info=(localize "STR_PUNISHMENT_INFO_GLOBALBAN");
								_duration = 0;
							}
							else
							{
								GLOBALBANLIST = GLOBALBANLIST + [(name player)];
								PublicVariable "GLOBALBANLIST";
							};
						};
					
						if (_punishstate ==50) then 
						{
							_info=(localize "STR_PUNISHMENT_INFO_USATEAMKILL");
							_duration = 300;
						
							if ((name player) in GLOBALBANLIST) then 
							{
								_info=(localize "STR_PUNISHMENT_INFO_GLOBALBAN");
								_duration = 0;
							}
							else
							{
								GLOBALBANLIST = GLOBALBANLIST + [(name player)];
								PublicVariable "GLOBALBANLIST";
							};
						};
					}
					else
					{
						_info=(localize "STR_PUNISHMENT_INFO_GLOBALBAN");
						_duration = 0;
					};
				};
								
				if (_duration >0) then 
				{
					_punishmentcount = player getVariable "DAP_PUNISHMENT_COUNTER";
					
					if (isNil("_punishmentcount")) then 
					{
						player setVariable ["DAP_PUNISHMENT_COUNTER",1,true];
					}
					else
					{
						
						_punishmentcount = _punishmentcount+1;
						player setVariable ["DAP_PUNISHMENT_COUNTER",_punishmentcount,true];
						
						_duration = _duration*_punishmentcount;
						
						if (_punishmentcount >= 3) then 
						{
							if ((name player) in GLOBALBANLIST) then 
							{
								_info=(localize "STR_PUNISHMENT_INFO_GLOBALBAN");
								_duration = 0;
							}
							else
							{
								GLOBALBANLIST = GLOBALBANLIST + [(name player)];
								PublicVariable "GLOBALBANLIST";
								
								_info=(localize "STR_PUNISHMENT_INFO_GLOBALBAN");
								_duration = 0;
							};							
						};	
					};
				};
				
				0 FadeSound 0;
				0 FadeRadio 0;
		
				10 CutText [_info,"BLACK FADED",100];
									
				INSURGENTSZEROPOINT setPos [((getPos INSURGENTSZEROPOINT) select 0), ((getPos INSURGENTSZEROPOINT) select 1),-100];
		
				player attachTo [INSURGENTSZEROPOINT,[0,0,10000]];
			
				player setUnconscious true;
				player setCaptive true;
			
				sleep 5;
			
				if (_duration==0) then 
				{
		
					While {true} do 
					{
				
						sleep 3600;
					};
				}
				else
				{	
					_fixnumber =
					{
						if (_this < 10) then
						{
							format["0%1", _this];
						}
						else
						{
							str _this;
						};
					};
				
					While {_duration>0} do 
					{
						_h = (floor (_duration / 3600));
						_m = (floor ((_duration / 60) - (_h * 60)));
						_s = (floor (_duration - (_m * 60) - (_h * 3600)));
					
						_counter = format["\n\n%1:%2:%3", _h call _fixnumber, _m call _fixnumber, _s call _fixnumber];
					
						10 CutText [(_info+_counter),"BLACK FADED",100];
					
						sleep 1;
					
						_duration = _duration -1;
					};
				};		
				
				player setVariable ["DAP_PUNISHMENT_PROGRESS",nil,true];
		
				if ((name player) in GLOBALBANLIST) then 
				{
					GLOBALBANLIST = GLOBALBANLIST - [(name player)];
					PublicVariable "GLOBALBANLIST";
				};
		
				detach player;
				
				if ((rating player) <0) then {player addRating (abs(rating player));};
				
				player setUnconscious false;
				player setCaptive false;
					
				if ((side(group player))==WEST) then 
				{
					player setPos (getMarkerPos "respawn_west");
				};
				
				10 CutText ["","BLACK IN",5];
		
				10 FadeSound CurrentSoundVolume;
				10 FadeRadio CurrentRadioVolume;
		
				player setVariable ["DAP_PUNISHMENT",nil,true];
		
				ENDOFPUNISHMENT=1;
			}
			else
			{
				0 FadeSound 0;
				0 FadeRadio 0;
				
				INSURGENTSZEROPOINT setPos [((getPos INSURGENTSZEROPOINT) select 0), ((getPos INSURGENTSZEROPOINT) select 1),-100];
				player attachTo [INSURGENTSZEROPOINT,[0,0,0]];
			};	
		};
	};
};