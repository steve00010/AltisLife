_unit = _this select 0;
_type = _this select 1;

_unit removeWeapon (secondaryWeapon _unit);
_unit removeWeapon "Throw";

_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";

if (_type == 0) then 
{
	if (_unit isKindOF "i_g_soldier_lat_f") then 
	{
		removeBackpack _unit;
		_unit addBackPAck "B_Bergen_sgg";
		
		_types = [0,0,0,1,1,1];
		_type =  (_types select (floor(random(count _types))));

		switch (_type) do 
		{	
			case 0: {_unit addMagazine "Titan_AA" ; _unit addWeapon "launch_I_Titan_F";};
			case 1: {_unit addMagazine "Titan_AT" ; _unit addWeapon "launch_I_Titan_short_F";};
		};
		
		reload _unit;
	};
};


