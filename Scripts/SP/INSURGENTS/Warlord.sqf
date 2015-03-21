private ["_state","_surrender"];

_unit = _this select 0;

_state=0;
_surrender=0;

WaitUntil {sleep 5;((captive _unit)or(!(alive _unit)));};

if (alive _unit) then 
{
	While {(_state==0)} do 
	{
		if (_surrender==0) then 
		{
			_survar = _unit getVariable "DAP_CANSURRENDER";
		
			if (!(isNil("_survar"))) then 
			{
				if (({alive _x} count (units (group _unit)))==1) then 
				{
					if (alive _unit) then 
					{
						_unit setCaptive true;
						
						_unit setUnitPos "UP";
						_unit disableAI "Move";
						_unit allowGetIn false;
						 
						_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"; 
						
						_unit disableAI "Anim";
						_unit setVariable ["DAP_AIFAS_CANBEINTERROGATED",1,true];
						_surrender=1;	
					};
				};
			};
		};
				
		_capvar = _unit getVariable "DAP_AIFAS_CANBEINTERROGATED";

		if (_state==0) then 
		{
			if (!(isNil("_capvar"))) then 
			{
				if (_capvar==1) then 
				{
					[nil, nil, "per",rSPAWN, [_unit], 
					{
						_captured = _this select 0;
						
						if (!(isNull player)) then 
						{
							if ((side(group player))==WEST) then 
							{
								_action = _captured addAction [localize "STR_DAP_INTERROGATE", "Scripts\SP\Insurgents\Interrogation.sqf", [0],0,false,true]; 
							
								WaitUntil {sleep 5;((!(captive _captured))or(!(alive _captured)));};
	
								_captured removeAction _action;	
							};
						};

					}] call RE;
				
					_state =1;
				};
			};
		};
		
		if (!(alive _unit)) then {_state =1;};
		
		sleep 5;
	};
	
	if ("EvMap" in (items _unit)) then {_unit removeWeapon "EvMap";};
	
	_state=0;
	
	While {(_state==0)} do 
	{
		
		_unitstate = _unit getVariable "DAP_WARLORD_INTERROGATED";
		
		if (!(isNil("_unitstate"))) then 
		{
			_state = 1;
		};
		
		sleep 5;
	};
	
	_unit setCaptive false;
	
	_newcenter = createCenter RESISTANCE;
	_newgroup = createGroup _newcenter;

	[_unit] joinSilent _newgroup;

	sleep 60;

	if (alive _unit) then 
	{
		_unit setPos [0,0,0];
		_unit setDammage 1;
	};
};

