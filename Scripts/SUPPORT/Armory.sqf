_armory = _this select 0;

_armory allowDamage false;
_armory addEventHandler ["HandleDamage",{0}];

if ((isServer)or(isDedicated)) then 
{
	While {true} do 
	{
		clearMagazineCargoGlobal _armory;
		clearWeaponCargoGlobal _armory;
		clearItemCargoGlobal _armory;
		clearBackpackCargoGlobal _armory;
				
		sleep 300;
	};
};
