private ["_state","_buildings","_position","_pos","_bp","_endsearch","_endplace","_clearpos"];

_caller = _this select 1;

_allowedbuildings = ["Land_House_L_1_EP1","Land_House_K_1_EP1","Land_House_L_4_EP1","Land_House_C_5_V3_EP1","Land_House_C_12_EP1","Land_House_K_3_EP1","Land_House_C_5_V2_EP1","Land_House_C_4_EP1","Land_House_C_2_EP1","Land_House_L_7_EP1","Land_House_C_10_EP1","Land_House_K_6_EP1","Land_House_C_11_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_A_Office01_EP1","Land_A_Mosque_small_1_EP1","Land_A_Stationhouse_ep1","Land_House_C_5_EP1","Land_House_K_7_EP1","Land_Mil_ControlTower_EP1","Land_House_C_5_V1_EP1","Land_House_K_8_EP1","Land_A_BuildingWIP_EP1","Land_A_Villa_EP1","Land_House_C_1_EP1","Land_House_L_6_EP1","Land_House_L_3_EP1","Land_House_K_5_EP1","Land_House_C_1_v2_EP1"];
_buildingspositions = [[2],[2,3,4],[6],[0,2,6],[5,6],[9,2,3,5],[4,1,5],[7,13,15],[1,2,5,6,7,8,9],[1,2,3,4,5],[7,8,10,11,14],[6,7,8,9,10],[7,8,9,10],[4,5],[8,9,10,11,12,13,28,29,30,31,32],[5,6],[3,4,5],[6,9,13],[3,5],[1,5],[3,6],[3,6],[4,1,2,3],[18,20,24,25,26,27,28,29,30,31],[4,7,8,9],[2],[4,3],[0,1,2],[1,2],[0,1,2,3]];

if ((count ATTACKEDTARGETS)>0) then 
{
	_state=0;
	
	{
		_spawnpos = (getPos (ATTACKEDTARGETS select (floor(random(count ATTACKEDTARGETS)))));
		_Entities = _spawnpos nearEntities [["CAManBase","LandVehicle"],50];
		
		_nw=0;
		_ne=0;
		_nall=0;
		
		_nw = WEST countSide _Entities;
		_ne = sideENEMY countSide _Entities;
		
		_nall = _nw+_ne;
		
		if (_nall==0) then 
		{
			_position = _spawnpos;
			_state = 1;
		};
	
	}ForEach ATTACKEDTARGETS;
	
	if (_state==1) then 
	{
		_dir = (random 360);
		_range = (5+(random 5));
		_pos = [(_position select 0)+_range*sin(_dir), (_position select 1)+_range*cos(_dir), (_position select 2)];
	
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
				_caller setPos _clearpos;
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
				_caller setPos _clearpos;
			};
		};
	}
	else
	{
		HintSilent localize "STR_ACT_ATTACKEDCACHEISREVEALED";
	};	
}
else
{
	HintSilent localize "STR_ACT_NOATTACKEDCACHES";
};