private ["_group","_position","_clearposition"];

_caller = _this select 1;
_target = cursorTarget;

if (_target isKindOf "CAManBase") then 
{
	if (!(isPlayer _target)) then 
	{
		_group = nearestObjects [_target,["CAManBase"],5];
		
		{
			if (side(group _x)!=CIVILIAN) then {_group = _group - [_x];};
			
		}ForEach _group;
			
		if ((count _group) > 0) then 
		{
			if ((count _group) == 1) then 
			{
				_dir = (random 360);
				_position = [(getPos _target select 0)+50*sin(_dir),(getPos _target select 1)+50*cos(_dir),0];
		
				_clearposition = _position findEmptyPosition [5,250];
				
				if (count _clearposition > 1) then 
				{
					if (isMultiplayer) then 
					{
						[nil, _target, "loc", rSPAWN, [_target,_clearposition], 
						{
							(_this select 0) doMove (_this select 1);
			
						}] call RE;
					}
					else
					{
						_target doMove _clearposition;
					};
				}
				else
				{
					if (isMultiplayer) then 
					{
						[nil, _target, "loc", rSPAWN, [_target,_position], 
						{
							(_this select 0) doMove (_this select 1);
			
						}] call RE;
					}
					else
					{
						_target doMove _position;
					};
				};

			}
			else
			{
				{
					_dir = (random 360);
					_position = [(getPos _x select 0)+50*sin(_dir),(getPos _x select 1)+50*cos(_dir),0];
		
					_clearposition = _position findEmptyPosition [5,250];
					
					if (count _clearposition > 1) then 
					{
						if (isMultiplayer) then 
						{
							[nil, _x, "loc", rSPAWN, [_x,_clearposition], 
							{
								(_this select 0) doMove (_this select 1);
			
							}] call RE;
						}
						else
						{
							_x doMove _clearposition;
						};
					}
					else
					{
						if (isMultiplayer) then 
						{
							[nil, _x, "loc", rSPAWN, [_x,_position], 
							{
								(_this select 0) doMove (_this select 1);
			
							}] call RE;
						}
						else
						{
							_x doMove _position;
						};
					};
					
				}ForEach _group;
			};
		};
	};
};