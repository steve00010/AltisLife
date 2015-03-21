private ["_range","_nearunits","_countenemy","_unitarms"];

_unit = _this select 0;
_enemyside = _this select 1;
_range=50;
_unitarms=0;

sleep 5;

_nearunits = _unit nearEntities _range;
_countenemy = _enemyside countSide _nearunits;

if (!(isPlayer _unit)) then
{
	if (skill _unit > 0.65) then {_range=75;};
	if (skill _unit > 0.85) then {_range=100;};

	_unit setVariable ["DAP_AIFAS_CANBEINTERROGATED",1,true];
	
	While {_countenemy>0} do
	{
		_nearunits = _unit nearEntities _range;
		_countenemy = _enemyside countSide _nearunits;
		if (isPlayer _unit) then {_countenemy=-1;};
		
		if (!(alive _unit)) then {_countenemy=-1;};
		sleep 5;
	};
	
	_unit setVariable ["DAP_AIFAS_CANBEINTERROGATED",0,true];
}
else
{
	_nearunits = _unit nearEntities _range;
	_countenemy = _enemyside countSide _nearunits;
	
	While {_countenemy>0} do
	{
		_nearunits = _unit nearEntities 15;
		_countenemy = _enemyside countSide _nearunits;
		if ((currentWeapon _unit)!="") then {_countenemy=-1;};
		
		if (!(alive _unit)) then {_countenemy=-1;};
		sleep 1;
	};
	
	_unit setCaptive false;
		
	_nearunits = _unit nearEntities 50;
	{if (side _x == _enemyside) then {_x doFire _unit;};}ForEach _nearunits;
	
};

_unit addWeapon "Throw";
_unit addWeapon "Put";

_unit setCaptive false;
	
_unit enableAI "ANIM";
_unit enableAI "MOVE";
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";

_unit disableConversation false;
_unit setVariable ["BIS_noCoreConversations",false,true];

_unit setVariable ["BIS_BC_dragger",false,true];
_unit setVariable ["BIS_BC_dragged",false,true];
_unit setVariable ["BIS_BC_carried",false,true];
_unit setVariable ["DAP_Drag",0,true];
_unit setVariable ["DAP_PFA",2,true];

_unit setVariable ["DAP_WOUNDED_STATE",0,true];

_unit setUnitPos "AUTO";
_unit setSpeedMode "FULL";

_unit doMove (_unit modelToWorld [0,3,0]);
sleep 5;
[_unit] joinSilent (group _unit);
