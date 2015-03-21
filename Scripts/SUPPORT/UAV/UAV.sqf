private ["_state","_moving","_dir"];

_caller = _this select 0;
_targetpos = _this select 1;

_height = DAP_BF_UAVHEIGHT;

_state=0;
_dir =0;

_uav = createVehicle ["MQ9PredatorB_US_EP1", [0,0,0], [], 0, "FLY"];
_uav removeWeapon ((weapons _uav) select 1);

_uav lock true;

_gunner = createAgent ["US_Soldier_Pilot_EP1", [0,0,0], [], 0, "NONE"];
removeallweapons _gunner;

_gunner MoveInGunner _uav;

_caller remoteControl _gunner;
_uav switchcamera "internal";

_uav EngineOn true;

[_uav,_caller] execVM "Scripts\Support\UAV\UAVSETUP.sqf";

While {((alive _uav)and(_state==0))} do 
{
	_uav setVectorUP [0,0,0.01];
	
	_dir = (_dir +0.05);
	
	if (_dir>360) then {_dir = 0;};
	
	_uavdir = (_dir + 90);
	
	_velocity = velocity _uav;
	
	_uav setVelocity [sin(_uavdir)*10,cos(_uavdir)*10,0];
	
	_uav setPosATL [(_targetpos select 0)+sin(_dir)*500,(_targetpos select 1)+cos(_dir)*500, _height];		
	
	_uav setVectorDir [sin(_uavdir),cos(_uavdir),0];
	
	sleep 0.005;
	
	if ((inputAction "LockTargets") == 1) then {_state=1;};
	
	if ((fuel _uav)<=0.25) then {_state=1;};
	
	if (!(alive _caller)) then {_state=1;};	
};

15 CutText ["","BLACK FADED",5];

objnull remoteControl _gunner;
_caller switchcamera "internal";

15 CutText ["","BLACK IN",5];

DAP_BF_WEST_UAV=0;
publicVariable "DAP_BF_WEST_UAV";