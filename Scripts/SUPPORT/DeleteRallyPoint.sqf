_rallypoint = _this select 0;

DAP_ALL_RALLYPOINTS = DAP_ALL_RALLYPOINTS - [_rallypoint];
publicVariable "DAP_ALL_RALLYPOINTS"; 
deleteVehicle _rallypoint;