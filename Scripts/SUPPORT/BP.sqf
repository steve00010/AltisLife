_unit = (_this select 1);
_type = (_this select 3) select 0;

removeBackpack _unit;

sleep 0.5;
if (!(_type == "")) then 
{
	_unit addBackpack _type;
};

