/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
	  Edited by Abuk007
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption","_fuelDisplay"];

while{true} do 
{
	_vehicleToFuel = (vehicle player);
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
		
		_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;
		if(_fuelConsumption > 0.002) then
		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		_fuelDisplay = round(_fuelConsumption*100000/2)/10;
		//hint format["Fuel Usage: %1 L/km",_fuelDisplay];

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Your fuel tank is almost empty. Hurry to the next gas station!";
		}
		else
		{
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "I hope your legs are ok, because you are out of fuel.";
			};
		};
	};
	sleep 2;
};