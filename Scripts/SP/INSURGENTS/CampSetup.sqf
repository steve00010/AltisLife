private ["_firepit","_pos"];

_pos = _this select 0;
_alltents = [];

_nearestBuildings = nearestObjects [_pos,["House"],DAP_AREASIZE];

if ((count _nearestBuildings) < 1) then 
{
	_firepit = "FirePlace_burning_F" createVehicle _pos;	
	
	_pos = (getPos _firepit);
	_cutter = "Land_ClutterCutter_medium_F" createVehicle _pos;
	_cutter setPos _pos;
};
