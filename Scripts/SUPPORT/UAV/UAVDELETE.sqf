_uav = _this select 0;

if (alive _uav) then 
{
	_gunner setPos [0,0,100000];
	deleteVehicle _gunner;
	deleteVehicle _uav;
}
else
{
	sleep 600;
	
	if (!(isNull _gunner)) then 
	{
		_gunner setPos [0,0,100000];
		deleteVehicle _gunner;
	};
	
	deleteVehicle _uav;
};