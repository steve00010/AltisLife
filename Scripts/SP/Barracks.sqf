_barracks = _this select 0;
_side = _this select 1;

_barracks allowDamage false;
_barracks setVariable ["DAP_BF_BUILDINGSIDE",_side,true];

if (!(isMultiplayer)) then 
{
	_barracks AddAction [localize "STR_RECRUITING", "Scripts\SP\Recruiting.sqf", [0],0,false,true]; 
};