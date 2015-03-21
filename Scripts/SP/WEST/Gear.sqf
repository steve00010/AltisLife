private ["_uavbp"];

_unit = _this select 0;
_uavbp=0;

if (local _unit) then 
{
	While {(alive _unit)} do 
	{
		if ("EvMap" in (items _unit)) then 
		{
			_unit removeWeapon "EvMap";
			
			_ALLTARGETS = TARGETS;
			
			if ((count _ALLTARGETS) >0) then 
			{
				_openedcache = (_ALLTARGETS select (floor(random (count _ALLTARGETS))));
	
				_data = _openedcache getVariable "DAP_CACHE_POSITION";
				_point = _data select 1;
	
				_markername = "AREAMARKER_"+(str(_point));
				_pos = getPos _openedcache;
	
				_markername setMarkerShape "ELLIPSE";
				_markername setMarkerBrush "DiagGrid"; 
				_markername setMarkerSize [DAP_MARKERSIZE,DAP_MARKERSIZE];
				_markername setMarkerDir 0;
				_markername setMarkerColor "ColorRED";
				_markername setMarkerPos _pos;
	
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
			};
		};
		
		if (!(isNull(unitBackpack _unit))) then 
		{
			if ((typeof (unitBackpack _unit)) == "US_UAV_Pack_EP1") then 
			{
				if (_uavbp==0) then 
				{
					CallUav = _unit addaction [localize "STR_ACT_CALLUAV","Scripts\Support\UAV\UAVREQUEST.sqf",[],0,false,true];
					_uavbp=1;
				};
				
			}
			else
			{
				if (_uavbp==1) then 
				{
					_unit removeAction CallUav;
					_uavbp=0;
				};
			};
		}
		else
		{
			if (_uavbp==1) then 
			{
				_unit removeAction CallUav;
				_uavbp=0;
			};
		};
		
		sleep 1;
		
		if ((rating _unit) < 0) then {_unit addRating (abs(rating _unit));};
	};
	
	if (_uavbp==1) then 
	{
		_unit removeAction CallUav;
	};
};