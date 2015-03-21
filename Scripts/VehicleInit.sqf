private ["_strategytype","_spawnpos","_vehicleDir","_vehicleClass"];

_vehicle = _this select 0;
_strategytype = _this select 1;

_spawnpos = _vehicle modelToWorld [0,0,0];
_vehicleDir = getDir _vehicle;

if (isNil("_strategytype")) then {_strategytype = 0;};

_strategytype = round(_strategytype);

if (_strategytype>2) then {_strategytype =0;};
if (_strategytype<0) then {_strategytype =0;};

if ((isServer)or(isDedicated)) then 
{
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;

	sleep 1;

	if (DAP_BF_AI_ENABLED==1) then 
	{
		if (count(crew _vehicle)>0) then 
		{
			_group = (group (driver _vehicle)); 
			_crew = units _group;

			_spawnedcrewtype = (typeof ((crew _vehicle)select 0));

			_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");

			{_x addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];}ForEach crew _vehicle;
	
			[_vehicle, _crew,_spawnpos,_vehicleDir,_group,_spawnedcrewtype,_strategytype] execVM "Scripts\AI\VehicleManager.sqf";
		}
		else
		{
		
			[_vehicle,_spawnpos,_vehicleDir] execVM "Scripts\SP\EmptyVehicle.sqf";

		};
	}
	else
	{
		if ((side(group(driver _vehicle)))==WEST) then 
		{
			_vehicleClass = typeOf _vehicle;
			{deleteVehicle _x;}ForEach crew _vehicle;

			deleteVehicle _vehicle;
			WaitUntil {sleep 1;(isNull _vehicle);};
		
			[_vehicleClass,_spawnpos,_vehicleDir] execVM "Scripts\SP\SpawnEmptyVehicle.sqf";
		}
		else
		{
			[_vehicle, _crew,_spawnpos,_vehicleDir,_group,_spawnedcrewtype,_strategytype] execVM "Scripts\AI\VehicleManager.sqf";
		};	
	};
	
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
};