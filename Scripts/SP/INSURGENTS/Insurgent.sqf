private ["_type","_shahidstate","_suicide","_spawnpos","_buildings","_endplace","_endsearch","_clearpos","_pos","_bp","_ALLCACHES","_countblufor","_limit"];

_man = _this select 0;

_allowedbuildings = ["Land_House_L_1_EP1","Land_House_K_1_EP1","Land_House_L_4_EP1","Land_House_C_5_V3_EP1","Land_House_C_12_EP1","Land_House_K_3_EP1","Land_House_C_5_V2_EP1","Land_House_C_4_EP1","Land_House_C_2_EP1","Land_House_L_7_EP1","Land_House_C_10_EP1","Land_House_K_6_EP1","Land_House_C_11_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_A_Office01_EP1","Land_A_Mosque_small_1_EP1","Land_A_Stationhouse_ep1","Land_House_C_5_EP1","Land_House_K_7_EP1","Land_Mil_ControlTower_EP1","Land_House_C_5_V1_EP1","Land_House_K_8_EP1","Land_A_BuildingWIP_EP1","Land_A_Villa_EP1","Land_House_C_1_EP1","Land_House_L_6_EP1","Land_House_L_3_EP1","Land_House_K_5_EP1","Land_House_C_1_v2_EP1"];
_buildingspositions = [[2],[2,3,4],[6],[0,2,6],[5,6],[9,2,3,5],[4,1,5],[7,13,15],[1,2,5,6,7,8,9],[1,2,3,4,5],[7,8,10,11,14],[6,7,8,9,10],[7,8,9,10],[4,5],[8,9,10,11,12,13,28,29,30,31,32],[5,6],[3,4,5],[6,9,13],[3,5],[1,5],[3,6],[3,6],[4,1,2,3],[18,20,24,25,26,27,28,29,30,31],[4,7,8,9],[2],[4,3],[0,1,2],[1,2],[0,1,2,3]];

if (local _man) then 
{
	dap_pistolstate=0;
	dap_riflestate=0;
	
	_shahidstate=0;
	
	removeAllWeapons _man;
	
	if (DAP_BF_MISSIONEND==0) then 
	{
		_punishstate = _man getVariable "DAP_PUNISHMENT";
		
		if (!(isNil("_punishstate"))) then 
		{
			if (_punishstate>=3) then 
			{
				ENDOFPUNISHMENT=0;
			
				[_man] execVM "Scripts\SP\Punishment\Punishment.sqf";
			
				WaitUntil {sleep 5;(ENDOFPUNISHMENT==1);};
			};
		};
		
		_countblufor = playersNumber WEST;
		
		if (((count units(group _man))*3)>_countblufor) then 
		{
			INSURGENTSZEROPOINT setPos [((getPos INSURGENTSZEROPOINT) select 0), ((getPos INSURGENTSZEROPOINT) select 1),-100];
			
			_man attachTo [INSURGENTSZEROPOINT,[0,0,0]];
			
			_limit=1;
			While {(_limit==1)} do 
			{
				HintSilent localize "STR_DAP_INSURGENTSLIMITINFO";
				
				_countblufor = playersNumber WEST;
				
				if (((count units(group _man))*3)<=_countblufor) then {_limit=0;};
				
				if (!(alive _man)) then {_limit=0;};
				
				sleep 5;
			};
			
			HintSilent "";
			
			detach _man;
		};
					
		if (alive _man) then 
		{
			[] execVM "Scripts\UI\CachesMarkers.sqf";
			
			if (_man == (leader (group _man))) then 
			{
				_ALLCACHES = TARGETS;
		
				if ((count ATTACKEDTARGETS)>0) then 
				{
					{
						_ALLCACHES = _ALLCACHES - [_x];
						
					}ForEach ATTACKEDTARGETS;
			
			
					if ((count _ALLCACHES)> 0) then 
					{
						_spawnpos = (getPos (_ALLCACHES select (floor(random(count _ALLCACHES)))));
					}
					else
					{
						_spawnpos = (getPos (TARGETS select (floor(random(count TARGETS)))));
					};			
				}
				else
				{ 
					_spawnpos = (getPos (TARGETS select (floor(random(count TARGETS)))));
				};
			}
			else
			{
				_spawnpos = (getPos (leader (group _man)));
				_Entities = _spawnpos nearEntities [["CAManBase"],50];
		
				_nw=0;
				_ne=0;
				_nall=0;
		
				_nw = WEST countSide _Entities;
				_ne = sideENEMY countSide _Entities;
		
				_nall = _nw+_ne;
		
				if (_nall==0) then
				{
					_spawnpos = (getPos (leader (group _man)));
				}
				else
				{
					_ALLCACHES = TARGETS;
			
					if ((count ATTACKEDTARGETS)>0) then 
					{
						{
						
							_ALLCACHES = _ALLCACHES - [_x];
								
						}ForEach ATTACKEDTARGETS;
			
			
						if ((count _ALLCACHES)> 0) then 
						{
							_spawnpos = (getPos (_ALLCACHES select (floor(random(count _ALLCACHES)))));
						}
						else
						{
							_spawnpos = (getPos (TARGETS select (floor(random(count TARGETS)))));
						};			
					}
					else
					{ 
						_spawnpos = (getPos (TARGETS select (floor(random(count TARGETS)))));
					};
			
				};
		
			};
	
			_dir = (random 360);
			_range = (5+(random 5));
			_pos = [(_spawnpos select 0)+_range*sin(_dir), (_spawnpos select 1)+_range*cos(_dir), (_spawnpos select 2)];
	
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
						if ((count(nearestObjects [(_building buildingPos _nx),["CAManBase"],2.5]))<1) then 
						{
							_bp = _bp+[_nx];
						};
					};
				};
	
				if ((count _bp)>0) then 
				{
					_clearpos = (_building buildingPos(_bp select (floor(random(count _bp)))));
					_man setPos _clearpos;
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
					_man setPos _clearpos;
				};
			};
	
			Takbir = _man addAction [(localize "STR_ACT_TAKBIR"),"Scripts\SP\Insurgents\Takbir.sqf",[],0,false,true];
	
			while {(alive _man)} do
			{
				if ((currentWeapon _man) !="") then 
				{
					_type = getNumber (configFile >> "CfgWeapons" >> (currentWeapon _man) >> "type");
				
					if ((currentWeapon _man) == (PrimaryWeapon _man)) then 
					{
						if (dap_riflestate==0) then 
						{
							if (((primaryWeapon _man) == "AK_47_S")or((primaryWeapon _man) == "AKS_74_U")or((primaryWeapon _man) == "AK_47_M")) then 
							{
								Hiderifle = _man addAction [(localize "STR_ACT_HIDE_RIFLE"),"Scripts\SP\Insurgents\HideRifle.sqf",[],0,false,true];
								dap_riflestate=1;
							};
						};
		
						if (dap_riflestate==1) then 
						{
							if (((primaryWeapon _man) != "AK_47_S")and((primaryWeapon _man) != "AKS_74_U")and((primaryWeapon _man) != "AK_47_M")) then 
							{
								_man removeAction Hiderifle;
								dap_riflestate=0;
							};
						};
				
						if (dap_pistolstate==1) then 
						{				
							_man removeAction Hidepistol;
							dap_pistolstate=0;
						};
					}
					else
					{
						if (((currentWeapon _man) != (PrimaryWeapon _man))and(dap_riflestate==1)) then 
						{
							_man removeAction Hiderifle;
							dap_riflestate=0;
						};
					
						if ((_type==2) and dap_pistolstate==0) then 
						{
							Hidepistol = _man addAction [(localize "STR_ACT_HIDE_PISTOL"),"Scripts\SP\Insurgents\HidePistol.sqf",[],0,false,true];
							dap_pistolstate=1;
						};
				
						if ((_type!=2) and dap_pistolstate==1) then 
						{				
							_man removeAction Hidepistol;
							dap_pistolstate=0;
						};
					};
				};				
		
				if ((rating _man) <0) then {_man addRating (abs(rating _man));};
		
				if (("DemoCharge_Remote_Mag" in (magazines _man)) and _shahidstate==0) then {_suicide = _man addaction [localize "STR_ACT_SUICIDE","Scripts\SP\Insurgents\Suicide.sqf",[],0,false,true]; _shahidstate=1;};
				if ( (({_x=="DemoCharge_Remote_Mag"} count (magazines _man))==0) and _shahidstate==1) then {_man removeAction _suicide; _shahidstate=0;};
		
				sleep 1;
			};
	
			_man removeAction Hidepistol;
			_man removeAction Hiderifle;
			_man removeAction Takbir;
	
			_man removeAction Unhidepistol;
			_man removeAction Unhiderifle;
	
			_man setVariable ["DAP_INS_HOLSTER_PISTOL",nil,true];
			_man setVariable ["DAP_INS_HOLSTER_RIFLE",nil,true];
		
			_man setCaptive false;
		};
	};
};

