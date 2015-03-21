private ["_markername"];

_soldier = _this select 0;
_state=0;

if (local _soldier) then 
{

	While {(alive _soldier)} do 
	{
		_leader = (leader (group _soldier));
		_data = _leader getVariable "DAP_WEST_RALLYPOINT";
		
		if (!(isNil("_data"))) then 
		{
			_rallypoint = _data select 1;
			 
			if (!(isNull _rallypoint)) then 
			{
				_markername = "SquadRallyPoint";
				_position = getPos _rallypoint;
	
				if (_state == 0) then 
				{
			
					_marker = createMarkerLocal [_markername, _position];
					_marker setMarkerShapeLocal "ICON";
					_markername setMarkerTypeLocal "mil_dot";
					_markername setMarkerSizeLocal [0.75,0.75];
					_markername setMarkerDirLocal 0;
					_markername setMarkerColorLocal "colorGREEN";
					_markername setMarkerTextLocal (localize "STR_RALLYPOINT");
					_state = 1;
				}
				else
				{
					_markername setMarkerPosLocal (getPos _rallypoint);
				};
			}
			else
			{
				if (_state==1) then 
				{
					deleteMarkerLocal _markername;
					_state=0;
				};
			};		
		};
		sleep 3;
	};
};
