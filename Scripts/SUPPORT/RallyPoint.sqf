private ["_rallypoint"];

_unit = _this select 0;
_xpos = _unit modelToWorld [0,2,0];

_pos = [_xpos select 0, _xpos select 1, ((getPosATL _unit) select 2)];
{
	_datax = _x getVariable "DAP_WEST_RALLYPOINT";
			
	if (!(isNil("_datax"))) then 
	{
		_rallypointx = _datax select 1;
		if (!(isNull _rallypointx)) then 
		{
			DAP_ALL_RALLYPOINTS = DAP_ALL_RALLYPOINTS - [_rallypointx];
			publicVariable "DAP_ALL_RALLYPOINTS"; 
			deleteVehicle _rallypointx;
		};
	};
		
}ForEach units group _unit;
	
_rallypoint = "FlagSmall_F" createVehicle [0,0,0];
_rallypoint setPos _pos;

if (((getPos _rallypoint) select 2) >0.25) then 
{
	deleteVehicle _rallypoint;
	_rallypoint = "FlagSmall_F" createVehicle _pos;
};

_rallypoint setDir ((getDir _unit)-90);

sleep 0.5;

_rallypoint enableSimulation false;
_rallypoint addEventHandler ["HandleDamage",{0}];

DAP_ALL_RALLYPOINTS = DAP_ALL_RALLYPOINTS + [_rallypoint];
publicVariable "DAP_ALL_RALLYPOINTS"; 

_rallypoint setVariable ["DAP_WEST_RALLYPOINTOWNER", [_unit,(group _unit)],true];
_unit setVariable ["DAP_WEST_RALLYPOINT",[_unit,_rallypoint],true];

[nil, _unit, rSPAWN, [_unit, _rallypoint], 
{
	_man = _this select 0;
	_point = _this select 1;
	_point addAction [(localize "STR_RALLYPOINT_DELETE"),"Scripts\Support\DeleteRallyPoint.sqf",[],0,false,true];

}] call RE; 
