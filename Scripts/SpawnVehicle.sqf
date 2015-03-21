private ["_vehicleType", "_position", "_group","_oldgroup","_unit", "_crewType", "_vehicle","_COM","_crewspawnpos","_countx","_stack"];

_vehicleclass= _this select 0;
_spawnpos = _this select 1;
_spawnedcrewtype = _this select 2;
_vehicleDir = _this select 3;
_strategytype  = _this select 4;

_sides = [east, west, resistance, civilian];
_countx=0;

_turretsArray = [ [0],[1],[2],[3],[4],[5],[0,1],[0,2],[0,3],[0,4],[0,5],[1,1],[1,2],[1,3],[1,4],[1,5],[2,1],[2,2],[2,3],[2,4],[2,5] ];

if ((isServer)or(isDedicated)) then 
{
	_vehicleType = _vehicleclass;
	_position = _spawnpos;
	_vehicle = createVehicle [_vehicleType, [_position select 0, _position select 1, 0],[],0, "NONE"];
	_vehicle  setDir _vehicleDir;
	
	_vehicle  setPos [_position select 0, _position select 1, 0];
	_vehicle  setDir _vehicleDir;
	
	[nil, _vehicle, "per", rSPAWN, [_vehicle], 
	{
		if ((_this select 0) isKindOf "Heli_Transport_01_base_F") then 
		{
			(_this select 0) animateDoor ['door_L', 1];
			(_this select 0) animateDoor ['door_R', 1];
		};
		if (((_this select 0) isKindOf "Heli_Transport_02_base_F")or((_this select 0) isKindOf "Heli_Light_01_base_F")) then 
		{
			(_this select 0) setObjectTexture [0,"#(argb,8,8,3)color(0.0895,0.0895,0.0895,1)"];
			(_this select 0) setObjectTexture [1,"#(argb,8,8,3)color(0.0895,0.0895,0.0895,1)"];
			(_this select 0) setObjectTexture [2,"#(argb,8,8,3)color(0.0895,0.0895,0.0895,1)"];
		};
			
	}] call RE;
	
	_siden= getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "side");
	_group = createGroup (_sides select _siden);
	_crewType = _spawnedcrewtype;
		
	_crewspawnpos = _vehicle ModelToWorld [0,0,100000];
 	
	if (_strategytype==2) then 
 	{
		_vehicle  setPosATL [_position select 0, _position select 1, 0];
		_vehicle  setDir _vehicleDir;
	};
	
 	if (_strategytype==0) then 
 	{
 		sleep 45;

	};
	
	sleep 5;     
	
	unassignVehicle (assignedCommander _vehicle);
	unassignVehicle (assignedDriver _vehicle);
	unassignVehicle (assignedGunner _vehicle);

	if (damage _vehicle <0.25) then 
	{

		While {_countx < 3} do
		{
			_unit = _group createUnit [_crewType,[(_position select 0)-100*sin(getDir _vehicle), (_position select 1)-100*cos(getDir _vehicle),1000],[],50,"NONE"];
			_unit setVariable ["DAP_BF_CREW",1,true];
			
			if (isMultiplayer) then 
			{
				_xunit= _unit;
				[nil, _xunit, rSPAWN, [_xunit], 
				{
					_man = _this select 0;
					_man HideObject true;
					
				}] call RE;
			}
			else
			{
				_unit HideObject true;
			};
			
			_unit setPos _crewspawnpos;
			_group setFormDir _vehicleDir;
			_unit setDir _vehicleDir;

			_unit addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
			
			_stack = 0;
			if (((_vehicle EmptyPositions "Commander") >0)and(_stack==0)) then 
			{
				if (isMultiplayer) then 
				{
					_xunit= _unit;
					_xvehicle = _vehicle;
					
					[nil, _xunit, "loc", rSPAWN, [_xunit,_xvehicle], 
					{
						_man = _this select 0;
						_object = _this select 1;
  					
  						_man moveInCommander _object;
					
					}] call RE;
				}
				else
				{
					_unit MoveInCommander _vehicle;
				};
				
				_unit setUnitRank "LIEUTENANT";
				_stack =1;
			};
			
			if (((_vehicle EmptyPositions "Driver") >0)and(_stack==0)) then 
			{
				if (isMultiplayer) then 
				{
					_xunit= _unit;
					_xvehicle = _vehicle;
					
					[nil, _xunit, "loc", rSPAWN, [_xunit,_xvehicle], 
					{
						_man = _this select 0;
						_object = _this select 1;
  					
  						_man moveInDriver _object;
					
					}] call RE;
				}
				else
				{
					_unit MoveInDriver _vehicle;
				};
				
				_unit setUnitRank "CORPORAL";
				_stack =1;
			};
			
			if (((_vehicle EmptyPositions "Gunner") >0)and(_stack==0)) then 
			{
				if (isMultiplayer) then 
				{
					_xunit= _unit;
					_xvehicle = _vehicle;
					
					[nil, _xunit, "loc", rSPAWN, [_xunit,_xvehicle], 
					{
						_man = _this select 0;
						_object = _this select 1;
  					
  						_man moveInGunner _object;
					
					}] call RE;
				}
				else
				{
					_unit MoveInGunner _vehicle;
				};
				
				_unit setUnitRank "SERGEANT";
				_stack =1;
			};
						
			_countx = _countx+1;
		};
		  
		{
			_unit = _group createUnit [_crewType,[(_position select 0)-100*sin(getDir _vehicle), (_position select 1)-100*cos(getDir _vehicle),1000],[],50,"NONE"];
			_unit setVariable ["DAP_BF_CREW",1,true];
			
			if (isMultiplayer) then 
			{
				_xunit= _unit;
				[nil, _xunit, rSPAWN, [_xunit], 
				{
					_man = _this select 0;
					_man HideObject true;
					
				}] call RE;
			}
			else
			{
				_unit HideObject true;
			};
			
			_unit setPos _crewspawnpos;
			_group setFormDir _vehicleDir;
			_unit setDir _vehicleDir;
	
			_unit addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
			
			if (isMultiplayer) then 
			{	
				_xunit= _unit;
				_xvehicle = _vehicle;
				_xx = _x;
				
				[nil, _xunit, "loc", rSPAWN, [_xunit,_xvehicle,_xx], 
				{
					_man = _this select 0;
					_object = _this select 1;
					_number = _this select 2; 
  					
  					_man moveInTurret [_object,_number];
					
				}] call RE;
			}
			else
			{
				_unit moveInTurret [_vehicle,_x];
			};
				
		
		}ForEach _turretsArray;
		
		{
			if(_x == (vehicle _x)) then {deleteVehicle _x;};
			
		}ForEach units _group;
		
		if (((_vehicle EmptyPositions "Driver") >0)or((_vehicle EmptyPositions "Gunner") >0)or((_vehicle EmptyPositions "Commander") >0)) then 
		{
			{
				deleteVehicle _x;
				
			}ForEach units _group;
			
			_vehicletype = typeOf _vehicle;
			[_vehicle,_vehicletype,_spawnpos,_spawnedcrewtype,_vehicleDir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";
		}
		else
		{		
			{
				if (isMultiplayer) then 
				{
					_xunit= _x;
					[nil, _xunit, rSPAWN, [_xunit], 
					{
						_man = _this select 0;
						_man HideObject false;
					
					}] call RE;
				}
				else
				{
					_unit HideObject false;
				};
				
			}ForEach units _group;
			
			[_vehicle, (crew _vehicle),_spawnpos,_vehicleDir,_group,_spawnedcrewtype,_strategytype] execVM "Scripts\AI\VehicleManager.sqf";
		};
	}
	else
	{
		_vehicletype = typeOf _vehicle;
		[_vehicle,_vehicletype,_spawnpos,_spawnedcrewtype,_vehicleDir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";
	};
};