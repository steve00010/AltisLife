private ["_state","_chairuser"];

_unit = _this select 1;
_chair = cursorTarget;

_state = 0;

if (local _unit) then 
{
	_chairuser = _chair getVariable "DAP_CHAIRSTATE";
	
	if (!(isNil("_chairuser"))) then 
	{
		if (!(isNull _chairuser)) then 
		{
			if ((_chairuser distance _chair) > 2.5) then 
			{
				_chairuser = nil;
			};
		}
		else
		{
			_chairuser = nil;
		};
	};
	
	if (isNil("_chairuser")) then 
	{
		_chair setVariable ["DAP_CHAIRSTATE",_unit,true];
		
		_unit attachTo [_chair,[0,-0.15,-0.5]];
		
		if (isMultiplayer) then 
		{
			_unit setDir 180;
			[nil, nil, rSPAWN, [_unit], 
			{
				(_this select 0) switchMove "sykes_c0briefing_loop";
			}] call RE;
		}
		else
		{
			_unit switchMove "sykes_c0briefing_loop";
			_unit setDir 180;
		};
					
		_weapons = weapons _unit;
		_magazines = magazines _unit;
		
		removeAllWeapons _unit;
	
		While {((alive _unit)and(_state==0))} do 
		{
			if (inputAction "moveForward"==1) then {_state = 1;};
			if (!(animationState _unit == "sykes_c0briefing_loop")) then 
			{
				_unit switchMove "sykes_c0briefing_loop";
				
				if (isMultiplayer) then 
				{
					[nil, nil, rSPAWN, [_unit], 
					{
						(_this select 0) switchMove "sykes_c0briefing_loop";
			
					}] call RE;
				}
				else
				{
					_unit switchMove "sykes_c0briefing_loop";
				};
			};
			sleep 0.25;
		};
		detach _unit;
		
		if (isMultiplayer) then 
		{
			[nil, nil, rSPAWN, [_unit], 
			{
				(_this select 0) switchMove "AidlPercMstpSlowWrflDnon_player_0S";
			
			}] call RE;
		}
		else
		{
			_unit switchMove "AidlPercMstpSlowWrflDnon_player_0S";
		};
				
		_unit setPos (_chair modelToWorld [0,1,-0.5]);	
	
		{_unit addMagazine _x;}ForEach _magazines;
		{_unit addWeapon _x;}ForEach _weapons;
	
		if (!(PrimaryWeapon _unit == "")) then 
		{
			_unit selectWeapon (PrimaryWeapon _unit);
		}
		else
		{
			_unit selectWeapon ((weapons _unit)select 0);
		};
		
		_chair setVariable ["DAP_CHAIRSTATE",nil,true];
	}
	else
	{
		HintSilent (localize "STR_ACTION_INFO_CHAIRUSED");
	};
	
};