scriptName "MP\data\scriptCommands\moveIn.sqf";
_caller = _this select 0;
_target = _this select 1;
_veh = _this select 2;
_pos = _this select 3;

private ["_turretArray", "_cargoId"];

if (count _this > 4) then {
	if (_pos == "Gunner") then {
		_turretArray = _this select 4
	} else {
		_cargoId = _this select 4
	}
};

if (count _this <= 4) then {
	call compile format ["_target moveIn%1 _veh", _pos]
} else {
	if (_pos == "Gunner") then {
		_target moveInTurret [_veh, _turretArray]
	} else {
		_target moveInCargo [_veh, _cargoId]
	}
};