/*
	File: fn_gangMarkers.sqf
	Author: Steve
	
	Description:
	Marks gang members on the map for their gang
*/
private["_markers","_gang"];
_markers = [];
_gang = [];

while {true} do
{
	waitUntil {visibleMap};
	
	{
		if(side _x == civilian && !isNil {(group player) getVariable "gang_name"} && !isNil {(group _x) getVariable "gang_name"} && (group _x) getVariable "gang_name" == (group player) getVariable "gang_name" ) then {
			_gang set[count _gang,_x];
		}
	} foreach playableUnits; //Fetch list of gang members
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
		
		_markers set[count _markers,[_marker,_x]];
	} foreach _gang;
			
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (getPos _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_gang = [];
};