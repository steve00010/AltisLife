private ["_vehicles"];

_point = _this select 0;
_type = _this select 1;

if (isServer) then 
{
	While {true} do 
	{
		_vehicles = nearestObjects [_point,[_type],10];
		
		{if (!(alive _x)) then {_vehicles = _vehicles - [_x];};}ForEach _vehicles;
		
		if ((count _vehicles)>0) then 
		{
			_vehicle = (_vehicles select 0);
			if (!(isEngineOn _vehicle)) then 
			{
				sleep 5;
								
				if ((fuel _vehicle) < 100) then {_vehicle setFuel ((fuel _vehicle)+0.1);};
				if ((damage _vehicle)>0) then {_vehicle setDammage ((damage _vehicle)-0.1);};
				
				_vehicle setVehicleAmmoDef 1;
			}
			else
			{
				sleep 5;
			};
		}
		else
		{
			sleep 5;
		};
	};
};