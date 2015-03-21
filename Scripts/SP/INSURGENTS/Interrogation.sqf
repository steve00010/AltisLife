private ["_ALLTARGETS"];

_unit = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_unit removeAction _id;
_unit setVariable ["DAP_WARLORD_INTERROGATED",1,true];

_hasinfo = _unit getVariable "DAP_HASINFO";
if (!(isNil("_hasinfo"))) then 
{
	_cache = _unit getVariable "DAP_ASSIGNEDCACHE";
	_ALLTARGETS = TARGETS;

	if (!(isNil("_cache"))) then 
	{
		if (_cache in TARGETS) then 
		{
			_ALLTARGETS = _ALLTARGETS - [_cache];
		};
	};

	if ((count _ALLTARGETS) >0) then 
	{
		_openedcache = (_ALLTARGETS select (floor(random (count _ALLTARGETS))));
	
		_data = _openedcache getVariable "DAP_CACHE_POSITION";
	
		_position = _data select 0;
		_point = _data select 1;
	
		_markername = "AREAMARKER_"+(str(_point));
	
		_markername setMarkerShape "ELLIPSE";
		_markername setMarkerBrush "SolidBorder"; 
		_markername setMarkerSize [DAP_MARKERSIZE,DAP_MARKERSIZE];
		_markername setMarkerDir 0;
		_markername setMarkerColor "ColorRED";
		_markername setMarkerPos _position;
	
		_openedcache setVariable ["DAP_CACHE_REVEALED",[_openedcache,_point],true];
	
		[nil, nil, rSPAWN, [], 
		{
			if (!(isNull player)) then 
			{
				if ((side(group player))==WEST) then 
				{
					HintSilent localize "STR_DAP_INTERROGATE_INFORECIVED";
				};
			};
	
		}] call RE;
	}
	else
	{
		[nil, nil, rSPAWN, [], 
		{
			if (!(isNull player)) then 
			{
				if ((side(group player))==WEST) then 
				{
					HintSilent localize "STR_DAP_INTERROGATE_NOINFO";
				};
			};

		}] call RE;
	};
}
else
{
	[nil, nil, rSPAWN, [], 
	{
		if (!(isNull player)) then 
		{
			if ((side(group player))==WEST) then 
			{
				HintSilent localize "STR_DAP_INTERROGATE_NOINFO";
			};
		};

	}] call RE;
};



