private ["_state"];
_healer = _this select 0;

if (isPlayer _healer) then 
{
	DAP_FirstAid_KeyCheck = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
	_BKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_FirstAid_KeyCheck"];
	
	_state = _healer getVariable "DAP_DRAGGER_HEAL";
	if (isNil("_state")) then {_state = 0;}else{_state = 1;};
	
	While {(_state==1)} do 
	{
		_state = _healer getVariable "DAP_DRAGGER_HEAL";
		if (isNil("_state")) then {_state = 0;}else{_state = 1;};
		
		if (!(alive _healer)) then {_state = 0;};
		sleep 1;
	};
	
	(findDisplay 46) displayRemoveEventHandler ["keyDown",_BKP];
	_healer setVariable ["DAP_DRAGGER_HEAL",nil,true];
};