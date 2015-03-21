private ["_pos"];

{
	_data = _x getVariable "DAP_AREA_CLEAR";
	
	if (!(isNil("_data"))) then 
	{
		_cache = _data select 0;
		_point = _data select 1;
	
		_pos = (_cache getVariable "DAP_CACHE_POSITION") select 0;
			
		if (isNil("_pos")) then 
		{
			_pos = getPos _cache;
		};
	
		_markername = "AREAMARKER_"+(str(_point));

		_markername setMarkerShape "ELLIPSE";
		_markername setMarkerBrush "SolidBorder"; 
		_markername setMarkerSize [DAP_MARKERSIZE,DAP_MARKERSIZE];
		_markername setMarkerDir 0;
		_markername setMarkerColor "ColorIndependent";
		_markername setMarkerPos _pos;
	}
	else
	{
		_statedata = _x getVariable "DAP_CACHE_REVEALED";
		
		if (!(isNil("_statedata"))) then 
		{
			_cache = _statedata select 0;
			_point = _statedata select 1;
	
			_pos = (_cache getVariable "DAP_CACHE_POSITION") select 0;
			
			if (isNil("_pos")) then 
			{
				_pos = getPos _cache;
			};
	
			_markername = "AREAMARKER_"+(str(_point));

			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerBrush "SolidBorder"; 
			_markername setMarkerSize [DAP_MARKERSIZE,DAP_MARKERSIZE];
			_markername setMarkerDir 0;
			_markername setMarkerColor "ColorRED";
			_markername setMarkerPos _pos;
		};
	};
	
	
}ForEach ALLPOINTS; 