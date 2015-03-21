private ["_rallypoint","_rallypointaction","_rallypointactionstate"];

_unit = _this select 0;
_rallypointactionstate = 0;

if (local _unit) then 
{
	[_unit] execVM "Scripts\SP\WEST\Gear.sqf";
		
	_unit addAction [(localize "STR_ACTION_SITONCHAIR"), "Scripts\SP\WEST\UseChair.sqf", [0],0,false,true,"","((_this==player)and((_this distance cursorTarget) <= 2.5)and((cursorTarget isKindOf 'FoldChair')and(alive cursorTarget)))"];
	_unit addAction [localize "STR_ORDER_MOVEAWAY", "Scripts\SP\WEST\OrderMoveAway.sqf", [0],0,false,true,"","((_this==player)and((_this distance cursorTarget) <= 5)and((cursorTarget isKindOf 'CAManBase')and(alive cursorTarget)and(side (group cursorTarget) == CIVILIAN)))"];
	_unit addAction [localize "STR_IED_DISARM", "Scripts\SP\WEST\Disarm.sqf", [0],0,false,true,"","((_this==player)and((_this distance cursorTarget) <= 2.5)and((cursorTarget isKindOf 'IEDUrbanBig_Remote_Ammo')or(cursorTarget isKindOf 'IEDLandBig_Remote_Ammo')or(cursorTarget isKindOf 'IEDUrbanSmall_Remote_Ammo')or(cursorTarget isKindOf 'IEDLandSmall_Remote_Ammo')))"]; 
	
	if (isMultiplayer) then 	
	{
		_punishstate = _unit getVariable "DAP_PUNISHMENT";
		
		if (!(isNil("_punishstate"))) then 
		{
			if (_punishstate>=3) then 
			{
				ENDOFPUNISHMENT=0;
			
				[_unit] execVM "Scripts\SP\Punishment\Punishment.sqf";
			
				WaitUntil {sleep 5;(ENDOFPUNISHMENT==1);};
			};
		};
	};
			
	[_unit] execVM "Scripts\UI\RallyPointMarker.sqf";
					
	While {(alive _unit)} do 
	{
		WaitUntil {sleep 1;((_unit == leader (group _unit))or(!(alive _unit)));};
		
		if ((alive _unit)and(_unit == leader (group _unit))) then 
		{
			_rallypointaction = player addAction [localize "STR_RALLYPOINT_PLACE", "Scripts\Support\Rallypoint.sqf", [0],0,false,true,"","((_this==player)and((vehicle player)==player))"];
			_rallypointactionstate = 1;
		};
		
		WaitUntil {sleep 1;((_unit != leader (group _unit))or(!(alive _unit)));};
			
		if (_rallypointactionstate == 1) then 
		{
			_unit removeAction _rallypointaction;
		};
		_rallypointactionstate = 0;
	};
};