private ["_overcast"];
_weathertype = _this select 0;

switch (_weathertype) do 
{	
	case 0: {_overcast = (random 555);};
	case 1: {_overcast = 0;};
	case 2: {_overcast = 0.85;};
	case 3: {_overcast = 500;};
	case 4: {_overcast = 1000;};
	default {_overcast = 25;};
};

if (_overcast < 50) then {_overcast = 0;};
if ((_overcast > 50)and(_overcast < 500)) then {_overcast = 0.85;};
if ((_overcast > 500)and(_overcast < 1000)) then {_overcast = 500;};
if ((_overcast > 550)and(_overcast < 1000)) then {_overcast = 1000;};

0 setOvercast _overcast;
sleep 3;

simulWeatherSync;
While {true} do 
{
	0 setOvercast _overcast;
	if (_overcast >= 500) then 
	{
		0 setLightnings 0;
		if (_overcast == 1000) then 
		{
			0 setLightnings 0.5;
			10 setRain 0.95;
		};
	};
	sleep 5;
};