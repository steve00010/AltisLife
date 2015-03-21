_vehicleclass= _this select 0;
_spawnpos = _this select 1;
_vehicleDir = _this select 2;

if ((isServer)or(isDedicated)) then 
{
	_vehicleType = _vehicleclass;
	_position = _spawnpos;
	_vehicle = createVehicle [_vehicleType, [_position select 0, _position select 1, 100000],[],0, "NONE"];

	_vehicle  setDir _vehicleDir;
	_vehicle setvelocity [0,0,0];
	_vehicle  setPos [_position select 0, _position select 1, 0.15];
	
	[_vehicle,_spawnpos,_vehicleDir] execVM "Scripts\SP\EmptyVehicle.sqf";
	
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