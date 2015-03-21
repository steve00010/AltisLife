_unit = (_this select 1);
_type = (_this select 3) select 0;

removeGoggles _unit;

sleep 0.5;
if (!(_type == "")) then 
{
	_unit addGoggles _type;
};

