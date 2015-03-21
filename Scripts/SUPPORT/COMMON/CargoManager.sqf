private ["_cargodata","_data","_pos","_jumppos","_n"];

_vehicle = _this select 0;
_unit = _this select 1;

_cargodata = 0;
_data = [];

if ((typeOF _vehicle) == "BTR90") then 
{
	_data =[[330,[-0.8,-0.5,-0.1],"aav_cargo01"], [340,[-0.85,-1.8,-0.05],"aav_cargo01"],[270,[-0.95,-3.3,-0.05],"aav_cargo01"],[150,[0.8,-0.5,-0.1],"aav_cargo01"],[90,[0.95,-1.8,0.05],"stryker_cargo01"], [180,[0.85,-3.4,-0.1],"aav_cargo01"]]; 
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if ((typeOF _vehicle) == "BTR90_HQ") then 
{
	_data =[[330,[-0.5,-0.5,-0.5],"aav_cargo01"],[340,[-0.85,-1.8,-0.8],"aav_cargo01"],[270, [-0.95,-3.1,-0.8],"aav_cargo01"],[150,[0.5,-0.5,-0.5],"aav_cargo01"],[90,[0.95,-1.8,-0.7],"stryker_cargo01"],[180,[0.95,-3.1,-0.8],"aav_cargo01"]];
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if ((typeOF _vehicle) == "BMP3") then 
{
	_data =[[330,[-1.35,0,-0.5],"aav_cargo01"], [270,[-1.4,-1.75,-0.5],"stryker_cargo01"],[270,[-1.3,-2.85,-0.5],"aav_cargo01"],[150,[1,0,-0.5],"aav_cargo01"],[90,[1.13,-2.1,-0.5],"stryker_cargo01"], [180,[0.9,-3,-0.5],"aav_cargo01"]]; 
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if (_vehicle isKindOf "BMP2_Base") then 
{
	_data =[[245,[-0.85,0.375,-0.35],"aav_cargo03"],[270,[-0.9,-1.385,-0.35],"stryker_cargo01"],[200,[-0.8,-2.35,-0.4],"aav_cargo03"],[150,[0.95,0.35,-0.425],"aav_cargo01"],[90,[0.9,-1.385,-0.35],"stryker_cargo01"],[185,[0.7,-2.45,-0.4],"aav_cargo01"]];
	_jumppos=[[-3,0,-5],[-3,-2,-5],[-3,-4,-5],[3,0,-5],[3,-2,-5],[3,-4,-5]];
};
if (_vehicle isKindOf "BMP2_HQ_Base") then 
{
	_data =[[245,[-0.85,-0.25,-3.9],"aav_cargo03"],[270,[-1,-1.8,-3.9],"stryker_cargo01"],[270,[-0.7,-3.1,-3.65],"aav_cargo01"],[150,[1,0.3,-3.9],"aav_cargo01"],[90,[1,-1.8,-3.9],"stryker_cargo01"],[185,[0.7,-3.15,-3.65],"aav_cargo01"]];
	_jumppos=[[-3,0,-5],[-3,-2,-5],[-3,-4,-5],[3,0,-5],[3,-2,-5],[3,-4,-5]];
};

{
	_pos = (_x select 1);
	if (((count(nearestObjects [(_vehicle modelToWorld _pos),["CAManBase"],0.5]))==0)and(_cargodata==0)) then 
	{
		_cargodata = 1;
		_n = _forEachIndex;
	};
	
}ForEach _data;

if (_cargodata == 0) exitWith {if (isPlayer _unit) then {HintSilent (localize "DAP_CARGO_INF_NOPOS")};};

_unit setVariable ["DAP_WOUNDED_STATE",1,true];

_posdata = _data select _n;
_unit attachTo [_vehicle, _posdata select 1];

[nil,nil, rSPAWN,[_unit,(_posdata select 2),(_posdata select 0)],
{
	(_this select 0) switchMove (_this select 1);
	(_this select 0) setDir (_this select 2);
	
}] call RE;

sleep  1;

if (isPlayer _unit) then 
{
	WaitUntil {(((inputAction "MoveForward") == 1)or(!(alive _unit))or(!(alive _vehicle))or(!(canMove _unit))or((count(nearestObjects [(_vehicle modelToWorld (_posdata select 1)),["CAManBase"],0.5]))>1))};
	10 cuttext ["","BLACK IN", 2];
	_unit attachto [_vehicle,_jumppos select _n];
	_unit setDir (_posdata select 0);
	sleep 0.25;
	detach _unit;
	unassignVehicle _unit;	
	
	if(!(alive _vehicle)) then {_unit setDammage 1;};
	
	[nil,nil, rSPAWN,[_unit],
	{
		(_this select 0) switchMove "";
		
	}] call RE;
}
else
{
	WaitUntil {((!(alive _unit))or(!(alive _vehicle))or(!(canMove _unit))or(currentCommand _unit != ""))};
	_unit attachto [_vehicle,_jumppos select _n];
	_unit setDir (_posdata select 0);
	sleep 0.25;
	detach _unit;
	unassignVehicle _unit;	
	
	if(!(alive _vehicle)) then {_unit setDammage 1;};
	
	[nil,nil, rSPAWN,[_unit],
	{
		(_this select 0) setPos ((_this select 0) modelToWorld [0,0,0.15]);
		(_this select 0) switchMove "";
		
	}] call RE;
};

_unit setVariable ["DAP_WOUNDED_STATE",nil,true];
