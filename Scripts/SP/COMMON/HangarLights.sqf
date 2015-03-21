_hangar = _this select 0;

_lamps = [[0,12,0],[-6,-9,0],[0,-9,0],[6,-9,0]];

{
	_light = "#lightpoint" createVehicleLocal (_hangar modelToWorld _x);
	_light setLightAmbient[0.95, 0.95, 0.5];
	_light setLightColor[0.95, 0.95, 0.5];
	_light setLightBrightness 0.015;
	
}ForEach _lamps;