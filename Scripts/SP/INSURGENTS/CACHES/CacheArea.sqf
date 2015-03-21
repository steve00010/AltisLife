private ["_cache","_count","_squad","_group","_soldiers","_state","_stack","_spawnpos","_position","_pos","_n","_center","_guards","_buildings","_building","_bp","_endsearch","_endplace","_forcedexit"];

_cache = _this select 0;
_point = _this select 1; 
_type = _this select 2;

_spawnpos = getPos _cache;

_state = 0;
_stack = 0;

_squad = ["O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F"];

if (_type==1) then 
{
	_base = DAP_CACHE_FULLSQUADCOUNT select 0;
	_mod = DAP_CACHE_FULLSQUADCOUNT select 1;
	
	_count = _base +(round(random _mod));
	
	_cache setVariable ["DAP_CACHE_UNDERATTACK",0,true];
	
	While {(alive _cache)} do 
	{
		_Entities = _spawnpos nearEntities [["CAManBase","Air","LandVehicle"],DAP_CACHE_AREARANGE];
		
		_nw=0;
		_ne=0;
		_nall=0;
		
		_nw = WEST countSide _Entities;
		_ne = sideENEMY countSide _Entities;
		
		_nall = _nw+_ne;
		
		if (_nall>0) then 
		{
			_cache setVariable ["DAP_CACHE_UNDERATTACK",1,true];
			
			if (_stack == 0) then 
			{
				ATTACKEDTARGETS = ATTACKEDTARGETS+[_cache];
				PublicVariable "ATTACKEDTARGETS";
				
				[nil, nil, rSPAWN, [], 
				{
					if (!(isNull player)) then 
					{
						if ((side group player)==EAST) then 
						{
							Hint (localize "STR_ACT_DEFENDCACHE_MESSAGE");
						};
					};

				}] call RE;
								
				_n=0;
		
				_pos = [(_spawnpos select 0)+(random 3)*sin(random(360)), (_spawnpos select 1)+(random 3)*cos(random(360)), (_spawnpos select 2)];
		
				_center = createCenter EAST;
				_group = createGroup _center;
				
				_guards = [];
				
				_unit = _group createUnit ["O_officer_F", _pos, [], 0, "NONE"];

				_cachehousedata = _cache getVariable "DAP_CACHE_HOUSEDATA";
				if (!(isNil("_cachehousedata"))) then 
				{
					_cachebuilding = _cachehousedata select 0;
					_emptyposition = _cachehousedata select 1;
					
					_unit setPos (_cachebuilding buildingPos _emptyposition);
				}
				else
				{
					_unit setPos _spawnpos;
				};
														
				_unit addMPEventHandler ["mpkilled", {_this execVM "Scripts\SP\Punishment\KilledHandler.sqf";}];
							
				_unit setRank "CAPTAIN";
				_unit setSkill 0.45;
				
				_unit setSkill ["aimingaccuracy",DAP_BF_AI_AIMINGSKILL];
				_unit setSkill ["aimingspeed",1];

				_unit setDir (random(360));
				_unit setUnitPos "MIDDLE";
				
				_unit setVariable ["DAP_ASSIGNEDCACHE",_cache,true];
				_unit setVariable ["DAP_HASINFO",1,true];
			
				sleep 0.25;
				
				[_unit,1] execVM "Scripts\SP\Insurgents\InsurgentLoadout.sqf";
				[_unit] execVM "Scripts\SP\Insurgents\Warlord.sqf";
				
				[[_unit]] execVM "DAPMAN\Init.sqf";
				
				_guards = _guards + [_unit];
								
				_n=1;
				
				_housecount = (round(_count/5)); 
				
				while {(_n<_count)} do 
				{
					_pos = [(_spawnpos select 0)+15*sin(random(360)), (_spawnpos select 1)+15*cos(random(360)), (_spawnpos select 2)];
					
					_unitType = _squad select (floor(random (count _squad)));
					_unit = _group createUnit [_unitType, _pos, [], 0, "NONE"];
									
					_unit setSkill ["aimingaccuracy",DAP_BF_AI_AIMINGSKILL];
					_unit setSkill ["aimingspeed",1];
					
					_unit allowFleeing 0;
			
					doStop _unit;
					
					if (_n > _housecount) then 
					{
						_buildings = nearestObjects [_pos,["HOUSE"],DAP_AREASIZE];
						
						{
							_bpnx = (_x buildingPos 1);
		
							_bpnxx = _bpnx select 0;
							_bpnyx = _bpnx select 1;
							_bpnzx = _bpnx select 2;
		
							if ((_bpnxx == 0)and(_bpnyx == 0)and(_bpnzx == 0)) then 
							{
								_buildings = _buildings - [_x];
							};
		
						}ForEach _buildings;
						
						_clearpos = _pos findEmptyPosition [1.5,250];
						_endplace = 0;
						
						While {((count _buildings >0)and(_endplace==0))} do 
						{
							_building = (_buildings select (floor(random(count _buildings))));
	
							_bp = [];
							_endsearch=0;
							_nx=0;
	
							While {(_endsearch==0)} do
							{
								_nx=_nx+1;
		
								_bpn = (_building buildingPos _nx);
		
								_bpnx = _bpn select 0;
								_bpny = _bpn select 1;
								_bpnz = _bpn select 2;
		
								if ((_bpnx == 0)and(_bpny == 0)and(_bpnz == 0)) then 
								{
									_endsearch=1;
			
								}
								else
								{
									if ((count(nearestObjects [(_building buildingPos _nx),["CAManBase","Box_East_Wps_F"],2.5]))<1) then 
									{
										_bp = _bp+[_nx];
									};
								};
							};
	
							if ((count _bp)>0) then 
							{
								_clearpos = (_building buildingPos(_bp select (floor(random(count _bp)))));
								_unit setPos _clearpos;
								_endplace = 1;
							}
							else
							{
								_buildings = _buildings - [_building];
							};
						};
						
						if ((count _buildings) <1) then 
						{
							_clearpos = _pos findEmptyPosition [1.5,250];
						
							if ((count _clearpos) >0) then 
							{
								_unit setPos _clearpos;
							};
						};
						
						if (((getPosATL _unit) select 2)>0.5) then 
						{
							_unit setUnitPos "MIDDLE";
						};
					}
					else
					{
						_clearpos = _pos findEmptyPosition [1.5,250];
						
						if ((count _clearpos) >0) then 
						{
							_unit setPos _clearpos;
						};
						
						if (((getPosATL _unit) select 2)>1.5) then 
						{
							_unit setUnitPos "MIDDLE";
						};
					};
			
					_unit setDir (random(360));
					
					_guards = _guards + [_unit];
			
					_n=_n+1;
			
					sleep 0.25;
					
					[_unit,0] execVM "Scripts\SP\Insurgents\InsurgentLoadout.sqf";
				};
				
				sleep 5;
				
				if (DAP_BF_AI_UNLIMITEDAMMO==1) then {{[_x] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";}ForEach units _group;};
				
				_defendgroup = (units _group);
				_forcedexit = 0;
				_stack = 1;
				
				[_defendgroup,_spawnpos] execVM "Scripts\SP\Insurgents\CampFunctions.sqf";
			};

			if (_stack == 1) then 
			{
				if ((({alive _x} count (units _group))>1)) then 
				{
					if ((({alive _x} count (units _group))<=(round((count(_guards))/3)))and(_forcedexit==0)) then 
					{
						{
							if (((rankid _x) <3)and(alive _x)) then 
							{
								_x commandMove ([(_spawnpos select 0)+15*sin(random(360)), (_spawnpos select 1)+15*cos(random(360)), (_spawnpos select 2)] findEmptyPosition [1.5,250]);
							};
						
						}ForEach units _group;
						
						_forcedexit = 0;
						sleep 5;
					};	
				}
				else
				{
					if ((({alive _x} count (units _group))>0)) then 
					{
						[(leader _group)] joinSilent _group;
						doStop (leader _group);
					};
				};	
			};
		}
		else
		{
			_Entities = _spawnpos nearEntities [["CAManBase","Air","LandVehicle"],DAP_CACHE_AREARANGE];
		
			_nw=0;
			_ne=0;
			_nall=0;
		
			_nw = WEST countSide _Entities;
			_ne = sideENEMY countSide _Entities;
		
			_nall = _nw+_ne;
		
			if (_nall==0) then 
			{
				_cache setVariable ["DAP_CACHE_UNDERATTACK",0,true];
			
				if (_cache in ATTACKEDTARGETS) then 
				{
					ATTACKEDTARGETS = ATTACKEDTARGETS-[_cache];
					PublicVariable "ATTACKEDTARGETS";
				};
			
				if (_stack == 1) then 
				{
					_count = 0;
					
					{
						if (alive _x) then 
						{
							_count=_count+1;
						};
						
						_guards = _guards - [_x];				
						deleteVehicle _x;
					
					}ForEach _guards;
		
					deleteGroup _group;
					deleteCenter _center;
						
					if (_count < 5) then {_count=5;}; 
					if (alive _cache) then {_stack = 0;};
				};
			};
		};
		
		sleep 5;
	};
	
	_cache setVariable ["DAP_CACHE_UNDERATTACK",0,true];
	
	if (_cache in ATTACKEDTARGETS) then 
	{
		ATTACKEDTARGETS = ATTACKEDTARGETS-[_cache];
		PublicVariable "ATTACKEDTARGETS";
	};
	
	DEADTARGETS = DEADTARGETS+ [_cache];
	PublicVariable "DEADTARGETS";
	
	if (DAP_BF_MISSIONEND==0) then 
	{
		[nil,nil,rSPAWN, [], {HINT (localize "STR_DAP_CACHE_DESTROYED")}] call RE;
	};
	
	if (({alive _x} count _guards) > 0) then 
	{
		While {(({alive _x} count _guards) > 0)} do 
		{
			_Entities = _spawnpos nearEntities [["CAManBase","Air","LandVehicle"],DAP_CACHE_AREARANGE];
		
			_nw=0;
			_ne=0;
			_nall=0;
		
			_nw = WEST countSide _Entities;
			_ne = sideENEMY countSide _Entities;
		
			_nall = _nw+_ne;
		
			if (_nall==0) then 
			{
				{_guards = _guards - [_x]; deleteVehicle _x;}ForEach _guards;
				
				sleep 5;		
				
				deleteGroup _group;
				deleteCenter _center;
			};

			sleep 5;
		};
	};
}
else
{
	_base = DAP_CACHE_LIMITEDSQUADCOUNT select 0;
	_mod = DAP_CACHE_LIMITEDSQUADCOUNT select 1;
	
	_count = _base +(round(random _mod));
	
	While {(_state==0)} do 
	{
		_Entities = _spawnpos nearEntities [["CAManBase","Air","LandVehicle"],DAP_CACHE_AREARANGE];
		
		_nw=0;
		_ne=0;
		_nall=0;
		
		_nw = WEST countSide _Entities;
		_ne = SideENEMY countSide _Entities;
		
		_nall = _nw+_ne;
		
		if (_nall>0) then 
		{
			if (_stack == 0) then 
			{
				_n=0;
		
				_center = createCenter EAST;
				_group = createGroup _center;
				
				_guards = [];
				
				_unit = _group createUnit ["O_G_Soldier_TL_F", _spawnpos, [], 0, "NONE"];
						
				_unit setRank "LIEUTENANT";
				_unit setSkill 0.45;
				
				_unit setSkill ["aimingaccuracy",DAP_BF_AI_AIMINGSKILL];
				_unit setSkill ["aimingspeed",1];

				_unit setDir (random(360));
				_unit setUnitPos "MIDDLE";
				
				_guards = _guards + [_unit];
				
				_knowlege = (round (random 10));
				
				if (_knowlege >=5) then 
				{
					_unit setVariable ["DAP_HASINFO",1,true];
				};
				
				sleep 0.25;
				
				[_unit,1] execVM "Scripts\SP\Insurgents\InsurgentLoadout.sqf";
				[_unit] execVM "Scripts\SP\Insurgents\Warlord.sqf";
				
				[[_unit]] execVM "DAPMAN\Init.sqf";
				
				_n=1;
				
				_housecount = (round(_count/5)); 
				
				while {(_n<_count)} do 
				{
					_pos = [(_spawnpos select 0)+15*sin(random(360)), (_spawnpos select 1)+15*cos(random(360)), (_spawnpos select 2)];
					
					_unitType = _squad select (floor(random (count _squad)));
					_unit = _group createUnit [_unitType, _pos, [], 0, "NONE"];
				
					_unit setSkill ["aimingaccuracy",DAP_BF_AI_AIMINGSKILL];
					_unit setSkill ["aimingspeed",1];
					
					_unit allowFleeing 0;
			
					doStop _unit;
					
					if (_n > _housecount) then 
					{
						_buildings = nearestObjects [_pos,["HOUSE"],DAP_AREASIZE];
						
						{
							_bpnx = (_x buildingPos 1);
		
							_bpnxx = _bpnx select 0;
							_bpnyx = _bpnx select 1;
							_bpnzx = _bpnx select 2;
		
							if ((_bpnxx == 0)and(_bpnyx == 0)and(_bpnzx == 0)) then 
							{
								_buildings = _buildings - [_x];
							};
		
						}ForEach _buildings;
						
						_clearpos = _pos findEmptyPosition [1.5,250];
						_endplace = 0;
						
						While {((count _buildings >0)and(_endplace==0))} do 
						{
							_building = (_buildings select (floor(random(count _buildings))));
	
							_bp = [];
							_endsearch=0;
							_nx=0;
	
							While {(_endsearch==0)} do
							{
								_nx=_nx+1;
		
								_bpn = (_building buildingPos _nx);
		
								_bpnx = _bpn select 0;
								_bpny = _bpn select 1;
								_bpnz = _bpn select 2;
		
								if ((_bpnx == 0)and(_bpny == 0)and(_bpnz == 0)) then 
								{
									_endsearch=1;
			
								}
								else
								{
									if ((count(nearestObjects [(_building buildingPos _nx),["CAManBase","Box_East_Wps_F"],2.5]))<1) then 
									{
										_bp = _bp+[_nx];
									};
								};
							};
	
							if ((count _bp)>0) then 
							{
								_clearpos = (_building buildingPos(_bp select (floor(random(count _bp)))));
								_unit setPos _clearpos;
								_endplace = 1;
							}
							else
							{
								_buildings = _buildings - [_building];
							};
						};
						
						if ((count _buildings) <1) then 
						{
							_clearpos = _pos findEmptyPosition [1.5,250];
						
							if ((count _clearpos) >0) then 
							{
								_unit setPos _clearpos;
							};
						};
						
						if (((getPosATL _unit) select 2)>0.5) then 
						{
							_unit setUnitPos "MIDDLE";
						};
					}
					else
					{
						_clearpos = _pos findEmptyPosition [1.5,250];
						
						if ((count _clearpos) >0) then 
						{
							_unit setPos _clearpos;
						};
						
						if (((getPosATL _unit) select 2)>1.5) then 
						{
							_unit setUnitPos "MIDDLE";
						};
					};
					
					_unit setDir (random(360));
					
					_guards = _guards + [_unit];
			
					_n=_n+1;
			
					sleep 0.25;
					
					[_unit,0] execVM "Scripts\SP\Insurgents\InsurgentLoadout.sqf";
				};

				if (DAP_BF_AI_UNLIMITEDAMMO==1) then {{[_x] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";}ForEach units _group;};
				
				_defendgroup = (units _group);
				_forcedexit = 0;
				_stack = 1;
				
				[_defendgroup,_spawnpos] execVM "Scripts\SP\Insurgents\CampFunctions.sqf";
			};
			
			if (_stack == 1) then 
			{
				if (({alive _x} count (units _group))==0) then
				{
					_state = 1;
				}
				else
				{ 
					if ((({alive _x} count (units _group))>1)) then 
					{
						if ((({alive _x} count (units _group))<=(round((count(_guards))/3)))and(_forcedexit==0)) then 
						{
							{
								if (((rankid _x) <3)and(alive _x)) then 
								{
									_x commandMove ([(_spawnpos select 0)+15*sin(random(360)), (_spawnpos select 1)+15*cos(random(360)), (_spawnpos select 2)] findEmptyPosition [1.5,250]);
								};
						
							}ForEach units _group;
						
							_forcedexit = 0;
							sleep 5;
						};
					}
					else
					{
						if ((({alive _x} count (units _group))>0)) then 
						{
							[(leader _group)] joinSilent _group;
						};
					};
				};
			};
		}
		else
		{
			_Entities = _spawnpos nearEntities [["CAManBase","Air","LandVehicle"],DAP_CACHE_AREARANGE];
		
			_nw=0;
			_ne=0;
			_nall=0;
		
			_nw = WEST countSide _Entities;
			_ne = sideENEMY countSide _Entities;
		
			_nall = _nw+_ne;
		
			if (_nall==0) then 
			{
			
				if (_stack == 1) then 
				{
					if (({alive _x} count _guards)>0) then 
					{
						_stack = 0;
						_state = 0;
					}
					else
					{
						_state = 1;
					};
				
					_count=0;
				
					{
						if (alive _x) then 
						{
							_count=_count+1;
						};
						
						_guards = _guards - [_x];				
						deleteVehicle _x;
					
					}ForEach _guards;
				
					if (_count < 5) then {_count=5;}; 
				
					deleteGroup _group;
					deleteCenter _center;
				};
			};
		};
		
		sleep 5;
	};
};

_cache setVariable ["DAP_AREA_CLEAR",[_cache,_point],true];

_markername = "AREAMARKER_"+(str(_point));

_position = (_cache getVariable "DAP_CACHE_POSITION") select 0;
if (isNil("_position")) then 
{
	_position = _spawnpos;
};

_markername setMarkerShape "ELLIPSE";
_markername setMarkerBrush "SolidBorder"; 
_markername setMarkerSize [DAP_MARKERSIZE,DAP_MARKERSIZE];
_markername setMarkerDir 0;
_markername setMarkerColor "ColorIndependent";
_markername setMarkerPos _position;

if ((count _guards) > 0) then 
{
	WaitUntil {sleep 15; (({alive _x} count _guards)==0);};

	sleep 300;

	{deleteVehicle _x;}ForEach _guards;
	
	sleep 5;

	deleteGroup _group;
	deleteCenter _center;
};