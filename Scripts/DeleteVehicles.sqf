_vehicle = _this select 0;
_vehicletype = _this select 1;
_respawnpos = _this select 2;
_crewtype = _this select 3;
_dir = _this select 4;
_strategytype = _this select 5;

sleep 60;

While {(!(isNull _vehicle))} do 
{
	{if (isplayer _x) then {unassignVehicle _x;[_x] orderGetIn false;_x action ["getOut",_vehicle];}else{_x setPos [0,0,10000];deletevehicle _x;};}ForEach crew _vehicle;
	
	deleteVehicle _vehicle;
	sleep 30;
};

sleep 60;

[_vehicletype,_respawnpos,_crewtype,_dir,_strategytype]execVM "Scripts\SpawnVehicle.sqf";