private ["_binocular"];
_unit = _this select 1;

if (local _unit) then 
{
	_loadout=[assignedItems _unit,primaryWeapon _unit,primaryWeaponItems _unit,handgunWeapon _unit,handgunItems _unit,secondaryWeapon _unit,secondaryWeaponItems _unit,uniform _unit,uniformItems _unit,vest _unit,vestItems _unit,backpack _unit,backpackItems _unit,headgear _unit,goggles _unit];
	
	if ("Binocular" in (weapons _unit)) then 
	{
		_binocular = "Binocular";
	}
	else
	{
		_binocular = "";
	};
	
	_unit setVariable ["DAP_BF_PLAYERLOADOUT",[_loadout,_binocular],true];

	HintSilent localize "STR_ARMORY_LOADOUTWASSAVED";
	sleep 5;

	HintSilent "";
};