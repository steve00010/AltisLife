_caller = _this select 1;

_data = (leader (group _caller)) getVariable "DAP_WEST_RALLYPOINT";

if (!(isNil("_data"))) then 
{
	_rallypoint = (_data select 1);
	
	if (!(isNull _rallypoint)) then 
	{
		_spawnpos = (_rallypoint modelToWorld [0,0,0]);
		
		if (str(_spawnpos) != "[0,0,0]") then 
		{
			_pos = [(_spawnpos select 0)+ 5*sin(random(360)), (_spawnpos select 1)+ 5*cos(random(360)), (_spawnpos select 2)];
			_xpos = _pos findEmptyPosition [0.5,500];
			if (count(_xpos) < 1) then 
			{
				_caller setPos _pos;
			}
			else
			{
				_caller setPos _xpos;
			};
		}
		else
		{
			HintSilent localize "STR_RALLYPOINT_NO";
		};
	}
	else
	{
		HintSilent localize "STR_RALLYPOINT_NO";
	};
}
else
{
	HintSilent localize "STR_RALLYPOINT_NO";
}; 