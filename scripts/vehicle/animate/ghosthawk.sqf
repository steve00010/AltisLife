private ["_veh","_alt","_speed"];
_veh = _this select 0;
while {alive _veh} do {
    sleep 0.5;
    _alt = getPos _veh select 2;
    _speed = (sqrt ((velocity _veh select 0)^2 + (velocity _veh select 1)^2 + (velocity _veh select 2)^2));
    if ((_alt < 25) && (_speed < 50)) then {
    _veh animateDoor ['door_R',1]; 
    _veh animateDoor ['door_L',1];
    } else {
    _veh animateDoor ['door_R',0]; 
    _veh animateDoor ['door_L',0];
    };
	sleep 8;
};