private ["_points","_numberofpoints","_roadslist","_offset"];

sleep 5;

_points = _this;

if ((count _points)>1) then 
{
	_numberofpoints = (count _points);
	{
		if ((count _points) > (_numberofpoints/2)) then
		{
			_IEDChanse = (round(random 10));
			if (_IEDChanse <= 5) then 
			{
				_points = _points - [_x];
			};
		};
	
		sleep 0.25;
		
	}ForEach _points;
};

_IEDTypes = ["IEDUrbanBig_Remote_Ammo","IEDLandBig_Remote_Ammo","IEDUrbanSmall_Remote_Ammo","IEDLandSmall_Remote_Ammo"];
{
	_roadslist = (_x nearRoads DAP_IED_AREARANGE);
	_point = _x;
	
	{
		if ((_x distance _point)<((DAP_IED_AREARANGE/2)+(random(DAP_IED_AREARANGE/3)))) then {_roadslist = _roadslist - [_x];};
		sleep 0.25;
		
	}ForEach _roadslist;
	
	if ((count _roadslist) > 0) then 
	{
		_IEDPlace = (_roadslist select (floor (random (count _roadslist))));
		_IEDOffset = (round(random 10));
		_offset = -6.5;
		
		_nextRoad = ((roadsConnectedTo _IEDPlace)select 0);
		_roadDir = [(getPos _IEDPlace),(_nextRoad)] call BIS_fnc_DirTo;
		
		if (_IEDOffset >= 5) then 
		{
			_offset = -6.5;
		}
		else
		{
			_offset = 6.5;
		};
		
		_IEDPos = [((getPos _IEDPlace select 0)+_offset*sin((_roadDir)+90)),((getPos _IEDPlace select 1)+_offset*cos((_roadDir)+90)),0];
		
		_IED = (_IEDTypes select (floor (random (count _IEDTypes)))) createVehicle _IEDPos;
		_IED setDir ((getDir _IEDPlace)-90);
		
		[nil, nil, "per", rSPAWN, [_IED], 
		{
			if (!(isnull (_this select 0))) then 
			{
				_trigger = createTrigger["EmptyDetector", (getPos (_this select 0))];
				_trigger setTriggerArea[15,15,0,false];
				_trigger setTriggerActivation["WEST","PRESENT",true];
				_trigger setTriggerStatements["this", "[thistrigger] execVM 'Scripts\SP\Insurgents\IEDS\IEDExplode.sqf'", ""];
		
				(_this select 0) setVariable ["DAP_INS_IEDTRIGGER",_trigger,true];
				_trigger setVariable ["DAP_INS_IEDOBJECT",(_this select 0),true];
			};
			
		}] call RE;
	};
	
	sleep 0.25;

}ForEach _points;