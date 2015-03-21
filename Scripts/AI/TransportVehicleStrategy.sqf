 private ["_ALLCP","_WPPOS","_side","_vpl","_vehwp","_x","_group","_assignedgroup","_unitdestination","_randomdir","_position","_clearposition","_taskstate","_nearestUnits","_n","_unit","_cargospace","_targetunit","_evactimer","_checkpoint","_checpointclearposition","_vehiclecargo","_vehiclecrew","_LZ","_LZC"];

_vehicle = _this select 0;
_crew = _this select 1;
_respawnpos = _this select 2;
_dir = _this select 3;
_group =_this select 4;
_crewtype = _this select 5;
_strategytype = _this select 6;

_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
_vehicle enableCopilot false;

if ((!(isPlayer (driver _vehicle)))and(count(units _group)==1)) then {_vehicle lockDriver true;};

_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");

if (!(isPlayer driver _vehicle)) then 
{
	if (_side==0) then 
	{ 
		DAP_BF_EAST_TRANSPORT=DAP_BF_EAST_TRANSPORT+[_vehicle];
		PublicVariable "DAP_BF_EAST_TRANSPORT";
	};
	
	if (_side==1) then 
	{ 
		DAP_BF_WEST_TRANSPORT=DAP_BF_WEST_TRANSPORT+[_vehicle];
		PublicVariable "DAP_BF_WEST_TRANSPORT";
	};


	sleep (3+(random 2));

	_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
};

_vehicletype = typeOf _vehicle;

_vpl=0;
_taskstate=1;

if ((isServer)or (isDedicated)) then 
{
	While {alive _vehicle} do 
		{
			if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
			if  ((isNull(assignedDriver _vehicle)) or (!(alive(driver _vehicle))) or ({alive _x} count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
			{
				_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
				_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
				{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
				
				_vehicle setFuel 0;
				sleep 30;
				
				if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
				{
					_vehicle setFuel 100;
					_vehicle setDammage 1;
				}
				else
				{
					{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
					{deleteVehicle _x;}ForEach units _group;
					
					deletevehicle _vehicle;
				};		
			};
						
			{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle]; _vehicle engineOn false;};}ForEach crew _vehicle;
									
				if ((_vehicle getVariable "DAP_BF_TRANSPORTREADY"==0) and (_vehicle getVariable "DAP_BF_TRANSPORTMISSIONTYPE"==0) and (alive _vehicle)) then 
				{
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
						
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};

					_position = _vehicle getVariable  "DAP_BF_TRANSPORTTARGETPOS";
					_targetunit = _vehicle getVariable "DAP_BF_TRANSPORTTARGETUNIT";
					_checkpoint = getPos _targetunit;
					
					if (((_targetunit distance _vehicle)>DAP_BF_CARGOSEARCHRANGE) and ((_position distance _targetunit)>DAP_BF_TRANSPORT_MINDISTANCE)) then
					{		
						_evactimer = DAP_BF_TRANSPORT_TIME;
						
						_checpointclearposition = _checkpoint findEmptyPosition [15,500];
						
						if ((count _checpointclearposition)==0) then {_checpointclearposition=_checkpoint;};
						
						_LZC = "Land_HelipadEmpty_F"  createVehicle _checpointclearposition;
						
						_LZC setCaptive true;
						
						if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_checkpoint,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
						
						[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
						{
							_transport = _this select 0;
  							_targetedunit = _this select 1;
  							[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";

						}] call RE; 
						
						sleep 5;
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
						{
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
							_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
							
							{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
							
							_vehicle setFuel 0;
							sleep 30;
						
							if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
							{
								_vehicle setFuel 100;
								_vehicle setDammage 1;
							}
							else
							{
								{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
								{deleteVehicle _x;}ForEach units _group;
					
								deletevehicle _vehicle;
							};
						};
				
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
						if (_vehicle isKindOf "Helicopter") then  
						{
							_vehicle land "GET IN";	
						};
			
						_evactimer = DAP_BF_TRANSPORT_TIME;
				
						if((isNil("_evactimer")) or (_evactimer<180)) then {_evactimer=180;};
				
						While {(!(_targetunit in crew _vehicle) and (alive _vehicle) and (_evactimer>0))} do 
						{
							_evactimer = _evactimer-1;
							
							if (!(alive _targetunit)) then 
							{
								sleep 30;
								_evactimer = 0;
							};
							
							sleep 1;
						};
					
						deleteVehicle _LZC;
							
						deleteWaypoint [_group, 1];
						
						_clearposition = _position findEmptyPosition [15,500];
						
						if ((count _clearposition)==0) then {_clearposition=_position;};
						
						_LZ = "Land_HelipadEmpty_F"  createVehicle _clearposition;
						
						_LZ setCaptive true;
				
						if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
						sleep 5;
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
						{
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
							_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
							
							{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
							
							_vehicle setFuel 0;
							sleep 30;
						
							if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
							{
								_vehicle setFuel 100;
								_vehicle setDammage 1;
							}
							else
							{
								{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
								{deleteVehicle _x;}ForEach units _group;
					
								deletevehicle _vehicle;
							};
						};

						if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
						
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
												
						_vehiclecrew = [];
					
						{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
						
						if (_vehicle isKindOf "Helicopter") then  
						{
							_vehicle land "GET OUT";	
						};
						
						if ((count(AssignedCargo _vehicle))== 0) then 
						{
							WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
							sleep 30;								
						}
						else
						{
							WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
							sleep 5;
							While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
							{
								{
									if((!(alive _x)) and (_x in (AssignedCargo _vehicle))) then 
									{
										_vehiclecrew =_vehiclecrew+[_x];
									};
									if((alive _x) and (_x in (AssignedCargo _vehicle))) then
									{
										unassignVehicle _x;
										[_x] orderGetIn false;
									};
								
								}ForEach AssignedCargo _vehicle;
								sleep 1;
							};
						};
						
						deleteWaypoint [_group, 1];
				
						deleteVehicle _LZ;
						
						_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
											
						if (_vehicle isKindOf "AIR") then  
						{

							if (alive _vehicle) then {sleep 5;};
					
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
							{
								_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
								_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
								
								{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
								
								_vehicle setFuel 0;
								sleep 30;
						
								if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
								{
									_vehicle setFuel 100;
									_vehicle setDammage 1;
								}
								else
								{
									{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
									{deleteVehicle _x;}ForEach units _group;
					
									deletevehicle _vehicle;
								};
							};
					
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};			
							
							While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							_vehicle land "LAND";
					
							if (alive _vehicle) then {sleep 5;};
			
						}
						else
						{
							While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							sleep 5;
							_vehicle engineOn false;
						};
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
						{
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
							_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
							{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
							
							_vehicle setFuel 0;
							sleep 30;
						
							if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
							{
								_vehicle setFuel 100;
								_vehicle setDammage 1;
							}
							else
							{
								{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
								{deleteVehicle _x;}ForEach units _group;
					
								deletevehicle _vehicle;
							};
						};
						
						if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
						
						WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
							
						{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
							
						if (alive _vehicle) then 
						{
							sleep 30;
							
							_vehicle setDammage 0;

							_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
							_n =  (count _cfg) - 1;

							for "_i" from 0 to _n do 
							{
								_mn =  (_cfg select _i);
								_nm = getText (_mn >> "name");
								_vehicle setHit [_nm,  0];
							};
						
							_vehicle setFuel 100;
						};
					
						deleteWaypoint [_group, 1];
						
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];		
					}
					else
					{
						_evactimer = DAP_BF_TRANSPORT_TIME;
						
						if (alive driver _vehicle) then {_vehicle engineOn true;};
						
						[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
						{
							_transport = _this select 0;
  							_targetedunit = _this select 1;
  							[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";
					
						}] call RE;
						
						While {((!(_targetunit in crew _vehicle)) and (alive _vehicle) and (_evactimer>0))} do 
						{
							_evactimer = _evactimer-1;
							sleep 1;
						};
						
						_vehiclecargo = crew _vehicle;
						
						{if (!(_x in (units _group)) and (alive _x)) then {_vehiclecargo=_vehiclecargo-[_x];};}ForEach crew _vehicle;
						
						if ((count(_vehiclecargo))>0) then 
						{
							
							_clearposition = _position findEmptyPosition [15,500];
							
							if ((count _clearposition)==0) then {_clearposition=_position;};
						
							_LZ = "Land_HelipadEmpty_F"  createVehicle _clearposition;
							
							_LZ setCaptive true;
				
							if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
							sleep 5;
				
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
							{
								_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
								_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
								
								{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
								
								_vehicle setFuel 0;
								sleep 30;
						
								if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
								{
									_vehicle setFuel 100;
									_vehicle setDammage 1;
								}
								else
								{
									{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
									{deleteVehicle _x;}ForEach units _group;
					
									deletevehicle _vehicle;
								};
							};
							
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
							
							While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							
							_vehiclecrew = [];
					
							{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
							
							if (_vehicle isKindOf "Helicopter") then  
							{
								_vehicle land "GET OUT";	
							};
							
							if ((count(AssignedCargo _vehicle))== 0) then 
							{
								WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
								sleep 30;								
							}
							else
							{
								WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
								sleep 5;
								While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
								{
									{
										
										if((!(alive _x)) and (_x in (AssignedCargo _vehicle))) then 
										{
											_vehiclecrew =_vehiclecrew+[_x];
										};
										if((alive _x) and (_x in (AssignedCargo _vehicle))) then
										{
											unassignVehicle _x;
											[_x] orderGetIn false;
										};
								
									}ForEach AssignedCargo _vehicle;
									sleep 1;
								};
							};
								
							deleteVehicle _LZ;
							
							deleteWaypoint [_group, 1];
							
							_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
													
							if (_vehicle isKindOf "AIR") then  
							{

								if (alive _vehicle) then {sleep 5;};
					
								if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then 
								{
									_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
									_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
									{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
									
									_vehicle setFuel 0;
									sleep 30;
						
									if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
									{
										_vehicle setFuel 100;
										_vehicle setDammage 1;
									}
									else
									{
										{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
										{deleteVehicle _x;}ForEach units _group;
					
										deletevehicle _vehicle;
									};
								};
								
								if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};		
								
								While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								_vehicle land "LAND";
					
								if (alive _vehicle) then {sleep 5;};
			
							}
							else
							{
								While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								sleep 5;
								_vehicle engineOn false;
							};
				
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
							{
								_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
								_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
					
								{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
								
								_vehicle setFuel 0;
								sleep 30;
						
								if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
								{
									_vehicle setFuel 100;
									_vehicle setDammage 1;
								}
								else
								{
									{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
									{deleteVehicle _x;}ForEach units _group;
					
									deletevehicle _vehicle;
								};
							};
							
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
							
							WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
							
							{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
							
							if (alive _vehicle) then 
							{
								sleep 30;
								
								_vehicle setDammage 0;

								_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
								_n =  (count _cfg) - 1;

								for "_i" from 0 to _n do 
								{
									_mn =  (_cfg select _i);
									_nm = getText (_mn >> "name");
									_vehicle setHit [_nm,  0];
								};
						
								_vehicle setFuel 100;
							};
					
							deleteWaypoint [_group, 1];
				
						};
						_vehicle engineOn false;
						
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
					};

				};
	
				if ((_vehicle getVariable "DAP_BF_TRANSPORTREADY"==0) and (_vehicle getVariable "DAP_BF_TRANSPORTMISSIONTYPE"==1) and (alive _vehicle)) then 
				{
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};
					
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					_position = _vehicle getVariable  "DAP_BF_TRANSPORTTARGETPOS";
					_targetunit = _vehicle getVariable "DAP_BF_TRANSPORTTARGETUNIT";
		
					_clearposition = _position findEmptyPosition [15,500];
					
					if ((count _clearposition)==0) then {_clearposition=_position;};
						
					_LZ = "Land_HelipadEmpty_F"  createVehicle _clearposition;
					
					_LZ setCaptive true;
				
					if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
					
					[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
					{
						_transport = _this select 0;
  						_targetedunit = _this select 1;
  						[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";
					
					}] call RE; 
					
					sleep 5;
				
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};
					
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
					if (_vehicle isKindOf "Helicopter") then  
					{
						_vehicle land "GET IN";	
					};
			
					_evactimer = DAP_BF_TRANSPORT_TIME;
				
					if((isNil("_evactimer")) or (_evactimer<180)) then {_evactimer=180;};
				
					While {(!(_targetunit in crew _vehicle) and (alive _vehicle) and (_evactimer>0))} do 
					{
						_evactimer = _evactimer-1;
						
						if (!(alive _targetunit)) then 
						{
							sleep 30;
							_evactimer = 0;
						};
							
						sleep 1;
					};
					
					deleteVehicle _LZ;
							
					deleteWaypoint [_group, 1];
										
					_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
										
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
						
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};
					
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					sleep 5;
										
					if (_vehicle isKindOf "AIR") then  
					{
						if (alive _vehicle) then {sleep 5;};
					
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
						{
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
							_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
							
							{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
							
							_vehicle setFuel 0;
							sleep 30;
						
							if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
							{
								_vehicle setFuel 100;
								_vehicle setDammage 1;
							}
							else
							{
								{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
								{deleteVehicle _x;}ForEach units _group;
					
								deletevehicle _vehicle;
							};
						};
						
						if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
										
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						_vehicle land "LAND";
						
						if (alive _vehicle) then {sleep 5;};
			
					}
					else
					{
						While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						sleep 5;
						_vehicle engineOn false;
					};
					
					if (alive _vehicle) then {sleep 5;};
					
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};
					
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
					
					{if(!(_x in (units _group))) then {unassignVehicle _x;};}ForEach crew _vehicle;
					
					sleep 5;
					
					{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];};}ForEach crew _vehicle;
					
					{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
					
					if (alive _vehicle) then 
					{
						sleep 25;
						
						_vehicle setDammage 0;

						_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
						_n =  (count _cfg) - 1;

						for "_i" from 0 to _n do 
						{
							_mn =  (_cfg select _i);
							_nm = getText (_mn >> "name");
							_vehicle setHit [_nm,  0];
						};
						
						_vehicle setFuel 100;
					
					};
					
					_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];

				};

			sleep (3+(random 2));
			
			if (alive _vehicle) then
			{ 
				{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
				
				if (isNull(assignedDriver _vehicle)) then 
				{
					sleep 30;
					
					if (isNull(assignedDriver _vehicle)) then
					{
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
						_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
						{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
						
						_vehicle setFuel 0;
						sleep 30;
						
						if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
						{
							_vehicle setFuel 100;
							_vehicle setDammage 1;
						}
						else
						{
							{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
							{deleteVehicle _x;}ForEach units _group;
					
							deletevehicle _vehicle;
						};
					};
				};
			};
			
			if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then
			{
				_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
				_vehicle setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",5,true];
				
				{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
				
				_vehicle setFuel 0;
				sleep 30;
						
				if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE)then 
				{
					_vehicle setFuel 100;
					_vehicle setDammage 1;
				}
				else
				{
					{unassignVehicle _x;[_x] orderGetIn false; _x action ["getOut",_vehicle];}ForEach crew _vehicle;
					{deleteVehicle _x;}ForEach units _group;
					
					deletevehicle _vehicle;
				};
			};
			
			if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
			
			{unassignVehicle _x;}ForEach AssignedCargo _vehicle;
		};
	
	if ((!(alive _vehicle))or(isNull(_vehicle))) then 
	{
		{
	
			if (!(isPlayer _x)) then {_x setDammage 1;};
	
		}ForEach units _group;
	};
		
	if (_side==0) then 
	{ 
		DAP_BF_EAST_TRANSPORT=DAP_BF_EAST_TRANSPORT-[_vehicle];
		PublicVariable "DAP_BF_EAST_TRANSPORT";
	};
	
	if (_side==1) then 
	{ 
		DAP_BF_WEST_TRANSPORT=DAP_BF_WEST_TRANSPORT-[_vehicle];
		PublicVariable "DAP_BF_WEST_TRANSPORT";
	};

	WaitUntil {sleep 1;(count(units _group)==0)};
		
	deleteGroup _group;
		
	[_vehicle,_vehicletype,_respawnpos,_crewtype,_dir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";

};

