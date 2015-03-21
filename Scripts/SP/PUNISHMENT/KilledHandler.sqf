private ["_state","_killer"];

_killed =_this select 0;
_killer =_this select 1;

if (!(_killer isKindOf "CAManBase")) then 
{
	if (count(crew _killer)==1) then 
	{
		_killer = ((crew _killer) select 0);
	};
};

if (local _killer) then 
{
	if ((isPlayer _killer) and (_killer isKindOf "CAManBase")) then 
	{
		if (side(group _killer)==EAST) then 
		{
		
			if (_killed == _killer) then 
			{
				_state = _killed getVariable "DAP_PUNISHMENT";
	
				if (isNil("_state")) then 
				{
					_killer setVariable ["DAP_PUNISHMENT",1,true];
				}
				else
				{
					if (_state<3) then 
					{
						_state=_state+1;
						_killer setVariable ["DAP_PUNISHMENT",_state,true];
					};
				};
			}
			else
			{
				if ((typeOF _killed)=="C_man_polo_1_F") then 
				{
					if (side(group _killer)==EAST) then 
					{
						_killer setVariable ["DAP_PUNISHMENT",10,true];
												
						if (alive _killer) then 
						{
							[_killer] execVM "Scripts\SP\Punishment\Punishment.sqf";
						};
					};
				};
			};
		};
		
		if ((side(group _killer)==WEST)and(side(group _killed)==WEST)) then 
		{
			
			if (isPlayer _killed) then 
			{
				if (_killer != _killed) then 
				{
					if ((WESTSAFEAREA distance _killed)<=500) then 
					{
						_killer setVariable ["DAP_PUNISHMENT",50,true];
				
						if (alive _killer) then 
						{
							[_killer] execVM "Scripts\SP\Punishment\Punishment.sqf";
						};
					};
				};
			}
			else
			{
				_killer setVariable ["DAP_PUNISHMENT",50,true];
				
				if (alive _killer) then 
				{
					[_killer] execVM "Scripts\SP\Punishment\Punishment.sqf";
				};
			};		
		};
	};
};