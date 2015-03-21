private ["_ALLCACHES","_cache","_cacheposition","_crate","_endsearch","_usedcaches","_rangeoff","_match","_buildings","_building","_clearpos","_bp","_ccp","_cmp"];

_ALLCACHES = CACHES;
_NUMBER = CACHESNUMBER;

_chcount = (floor((count _ALLCACHES)/2));

for "_i" from 1 to _chcount do
{

	_ALLCACHES = _ALLCACHES-[(_ALLCACHES select (floor(random (count _ALLCACHES))))];

};

TARGETS=[];

DEADTARGETS = [];
PublicVariable "DEADTARGETS";

ATTACKEDTARGETS=[];
PublicVariable "ATTACKEDTARGETS";

_allowedbuildings = ["Land_House_L_1_EP1","Land_House_K_1_EP1","Land_House_L_4_EP1","Land_House_C_5_V3_EP1","Land_House_C_12_EP1","Land_House_K_3_EP1","Land_House_C_5_V2_EP1","Land_House_C_4_EP1","Land_House_C_2_EP1","Land_House_L_7_EP1","Land_House_C_10_EP1","Land_House_K_6_EP1","Land_House_C_11_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_A_Office01_EP1","Land_A_Mosque_small_1_EP1","Land_A_Stationhouse_ep1","Land_House_C_5_EP1","Land_House_K_7_EP1","Land_Mil_ControlTower_EP1","Land_House_C_5_V1_EP1","Land_House_K_8_EP1","Land_A_BuildingWIP_EP1","Land_A_Villa_EP1","Land_House_C_1_EP1","Land_House_L_6_EP1","Land_House_L_3_EP1","Land_House_K_5_EP1","Land_House_C_1_v2_EP1"];
_buildingspositions = [[2],[2,3,4],[6],[0,2,6],[5,6],[9,2,3,5],[4,1,5],[7,13,15],[1,2,5,6,7,8,9],[1,2,3,4,5],[7,8,10,11,14],[6,7,8,9,10],[7,8,9,10],[4,5],[8,9,10,11,12,13,28,29,30,31,32],[5,6],[3,4,5],[6,9,13],[3,5],[1,5],[3,6],[3,6],[4,1,2,3],[18,20,24,25,26,27,28,29,30,31],[4,7,8,9],[2],[4,3],[0,1,2],[1,2],[0,1,2,3]];

_usedcaches = [];
_rangeoff=0;

for "_i" from 1 to _NUMBER do
{
	if (((count TARGETS) > 0)and(_rangeoff==0)) then 
	{
		_endsearch = 0;
		
		While {(_endsearch==0)} do 
		{
			_cache = (_ALLCACHES select (floor(random (count _ALLCACHES))));
			_cacheposition = (getPos _cache);
			
			_match=0;
			
			{
				if ((_cacheposition distance _x) <= DAP_CACHE_AREARANGE) then 
				{
					_match = _match+1;
				};
				
			}ForEach TARGETS;
			
			_usedcaches = _usedcaches + [_cache]; 
			
			if (_match ==0) then 
			{
				_endsearch=1;
			};
							
			if ((count _usedcaches)==(count CACHES)) then 
			{
				_endsearch=1;
				_rangeoff=1;
			};
		};
	}
    	else
	{
		_cache = (_ALLCACHES select (floor(random (count _ALLCACHES))));
		_cacheposition = (getPos _cache);
	};
        
	_ALLCACHES = _ALLCACHES - [_cache];
    
	_crate = "Box_East_Wps_F" createVehicle _cacheposition;
    	_crate addEventHandler ["HandleDamage",{0}];
    
    	_dir = (random 360);
	_range = DAP_CACHE_AREASIZE;
	
	_buildings = nearestObjects [_cacheposition,["HOUSE"],_range];
	
	{
		if (((str(_x buildingPos 1))=="[0,0,0]")or((count(_x buildingPos 1))==0)) then 
		{
			_buildings = _buildings - [_x];
		};
						
	}ForEach _buildings;
	
	if (count _buildings > 0) then 
	{
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
					if ((count(nearestObjects [(_building buildingPos _nx),["CAManBase"],2.5]))<1) then 
					{
						_bp = _bp+[_nx];
					};
				};
			};
	
			if ((count _bp)>0) then 
			{
				if ((count _bp)>10) then 
				{
					_ccp = ((_bp select (floor(random 8)))+2);
					_cmp = (_ccp - 1);
					
					_clearpos = (_building buildingPos _ccp);
					_crate setPos _clearpos;

					_bp = _bp - [_clearpos];
					if ((count _bp)>1) then 
					{
						_crate setVariable ["DAP_CACHE_HOUSEDATA",[_building,_cmp],true];
					};
					
					_endplace = 1;
				}
				else
				{
					if ((count _bp)>5) then 
					{
						_ccp = ((_bp select (floor(random 3)))+2);
						_cmp = (_ccp - 1);
						
						_clearpos = (_building buildingPos _ccp);
						_crate setPos _clearpos;

						_bp = _bp - [_clearpos];
						if ((count _bp)>1) then 
						{
							_crate setVariable ["DAP_CACHE_HOUSEDATA",[_building,_cmp],true];
						};
						
						_endplace = 1;
					}
					else
					{
						_ccp = (_bp select (floor(random(count _bp))));
						_bp = _bp - [_ccp];
						
						if ((count _bp)>0) then 
						{
							_cmp = (_bp select (floor(random(count _bp))));
						}
						else
						{
							_cmp = _ccp;
						};
						
						_clearpos = (_building buildingPos _ccp);
						_crate setPos _clearpos;

						_bp = _bp - [_clearpos];
						if ((count _bp)>1) then 
						{
							_crate setVariable ["DAP_CACHE_HOUSEDATA",[_building,_cmp],true];
						};
						
						_endplace = 1;
					};
				};
			}	
			else
			{
				_buildings = _buildings - [_building];
			};
		};					
		
		if ((count _buildings) > 0) then
		{
			[nil, nil, "per",rSPAWN, [_building], 
			{
				_coverbuilding = _this select 0;
			
				if (side(group player)==EAST) then 
				{
					_coverbuilding allowDamage false;
				};
		
			}] call RE;
		}
		else
		{
			_crate setPos _cacheposition;
		};		
	}
	else
	{
		_crate setPos _cacheposition;	
	};
    
	_crate setVariable ["DAP_CACHE_POSITION",[_cacheposition,_i],true];
   
	clearMagazineCargo _crate;
	clearWeaponCargo _crate;
       
	{_crate addMagazineCargoGlobal _x;} ForEach EASTMAGAZINES;
	{_crate addWeaponCargoGlobal _x;} ForEach EASTWEAPONS;
    
	[_crate,_i,1] execVM "Scripts\SP\Insurgents\Caches\CacheArea.sqf";
    
	TARGETS = TARGETS+[_crate];
};

PublicVariable "TARGETS";

[TARGETS] execVM "Scripts\SP\Insurgents\Caches\CachesManager.sqf";

ALLPOINTS = (TARGETS+_ALLCACHES);
PublicVariable "ALLPOINTS";

sleep 5;

{
	_areaindex = (_ForEachIndex + (_NUMBER+1));
	[_x,_areaindex,0] execVM "Scripts\SP\Insurgents\Caches\CacheArea.sqf";
	
}ForEach _ALLCACHES;

{
	[(getPos _x)] execVM "Scripts\SP\Insurgents\CampSetup.sqf";
	
}ForEach ALLPOINTS;

{
	_x removeAllEventHandlers "HandleDamage";
	_x addMPEventHandler ["mpkilled", {_this execVM "Scripts\SP\ExplosionFX.sqf";}]; 
	
}ForEach TARGETS;

DAP_CACHES_SETUP_DONE = 1;
PublicVariable "DAP_CACHES_SETUP_DONE";