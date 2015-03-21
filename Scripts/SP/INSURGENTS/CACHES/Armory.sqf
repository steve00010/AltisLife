_armory = _this select 0;
_side = _this select 1;

sleep 1;

if ((isServer)or(isDedicated)) then 
{

	While {true} do 
	{
		clearMagazineCargoGlobal _armory;
		clearWeaponCargoGlobal _armory;
	
		{_armory addWeaponCargoGlobal _x;}ForEach EASTWEAPONS;
		{_armory addMagazineCargoGlobal _x;} ForEach EASTMAGAZINES;

		sleep 600;
 	};
};




