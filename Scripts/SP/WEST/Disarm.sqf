private ["_unitskill"];

_unit = _this select 1;
_IED = cursorTarget;

_TRIGGER = _IED getVariable "DAP_INS_IEDTRIGGER";

_unitskill = getNumber(configFile >> "CfgVehicles" >> (typeOf _unit) >> "candeactivatemines");
if ((!(_unitskill==1))or(isnil("_unitskill"))) then 
{
	_unitskill = getNumber(configFile >> "CfgVehicles" >> (typeOf _unit) >> "canhidebodies");
	
	if ((gettext(configFile >> "CfgVehicles" >> (typeOf _unit) >> "namesound"))=="veh_SpecialForce") then 
	{
		_unitskill = 1;
	};
	
	if (_unit isKindOf "RUS_Soldier_Base") then 
	{
		_unitskill = 1;
	};
};

if (_unitskill==1) then 
{
	deleteVehicle _TRIGGER;
	deleteVehicle _IED;
}
else
{
	_IEDPos = (getPos _IED);
	
	deleteVehicle _TRIGGER;
	deleteVehicle _IED;
	
	_BOOM = "Bo_GBU12_LGB" createVehicle _IEDPos;
};

