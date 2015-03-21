private ["_state","_caches","_markers","_attackedcaches","_cautionmarkers","_markername","_position","_marker","_cautionmarkername","_cautionposition","_cautionmarker"];

_markers = [];
_cautionmarkers = [];

if (side (group player)!=WEST) then 
{
	While {true} do 
	{
		{
			_markername = str(_x);
			_markernamecache = str(_x)+"_CACHEPOINT";
			
			_position = (_x getVariable "DAP_CACHE_POSITION") select 0;
			
			if (isNil("_position")) then 
			{
				_position = getPos _x;
			};
			
			if (alive _x) then 
			{
				_marker = createMarkerLocal [_markername, _position];
				_marker setMarkerShapeLocal "ELLIPSE";
				_markername setMarkerBrushLocal "SolidBorder"; 
				_markername setMarkerSizeLocal [DAP_MARKERSIZE,DAP_MARKERSIZE];
				_markername setMarkerDirLocal 0;
				_markername setMarkerColorLocal "ColorRed";
				
				_cachemarker = createMarkerLocal [_markernamecache, (getPos _x)];
				_cachemarker setMarkerShapeLocal "ICON";
				_markernamecache setMarkerTypeLocal "hd_destroy"; 
				_markernamecache setMarkerSizeLocal [0.75,0.75];
				_markernamecache setMarkerDirLocal 50;
				_markernamecache setMarkerColorLocal "ColorRed";
				
				_markers = _markers +[_markername];
				_markers = _markers +[_markernamecache];
			};
			
			_state = _x getVariable "DAP_CACHE_UNDERATTACK";
			
			if (_state == 1) then 
			{
				_cautionmarkername =  str(_x)+"_CAUTION";
				_cautionposition = _position;
				
				if (alive _x) then 
				{
					_cautionmarker = createMarkerLocal [_cautionmarkername, _cautionposition];
					_cautionmarker setMarkerShapeLocal "ELLIPSE";
					_cautionmarkername setMarkerBrushLocal "SolidBorder"; 
					_cautionmarkername setMarkerSizeLocal [((DAP_MARKERSIZE)+10),((DAP_MARKERSIZE)+10)];
					_cautionmarkername setMarkerDirLocal 0;
					_cautionmarkername setMarkerColorLocal "ColorBLUE";
					_cautionmarkers = _cautionmarkers +[_cautionmarkername];
				};
			};
			
		}ForEach TARGETS;
		
		sleep 15;
				
		{
			deleteMarkerLocal _x;
			
		}ForEach _markers;
		
		{
			deleteMarkerLocal _x;
			
		}ForEach _cautionmarkers;
		
		_markers = [];
		_cautionmarkers = [];
		
	};
};

