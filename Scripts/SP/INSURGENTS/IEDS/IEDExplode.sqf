private ["_state"];

_trigger = _this select 0;
_list =  list _trigger;

_state = 0;

{
	if ((_x isKindOf "LandVehicle") and (_state == 0)) then
	{
		if (local (driver _x)) then 
		{
			_IED = _trigger getVariable "DAP_INS_IEDOBJECT";
		
			if (!(isNil("_IED"))) then 
			{
				if (!(isNull _IED)) then 
				{
					deleteVehicle _IED;
					deleteVehicle _trigger;
				
					_boom = "Bo_GBU12_LGB" createVehicle getPos _trigger;
					_boom setVelocity [0,0,-1000];
					
					_state = 1;
				}
				else
				{
					deleteVehicle _trigger;
					_state = 1;
				};
			}
			else
			{
				deleteVehicle _trigger;
				_state = 1;
			};
		};
	};

}ForEach _list;

