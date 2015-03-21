if (PrimaryWeapon _unit != "") then 
{
	_unit selectWeapon (primaryWeapon _unit);
}
else
{
	if (SecondaryWeapon _unit != "") then
		{
			_unit selectWeapon (primaryWeapon _unit);
		};
};

