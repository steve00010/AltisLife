/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the Spray shop menu.
*/
if(life_action_inUse) exitWith {hint "An action is already being processed..."};
disableSerialization;
private["_nearVehicles","_nearVehicles1","_control"];
_nearVehicles1 = [];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
	_nearVehicles1 pushBack _vehicle;
}
else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Truck"],25]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_nearVehicles1 pushBack _x;
				};
			};
		} foreach _nearVehicles;
	};
};

//Error check
if(count _nearVehicles1 == 0) exitWith {titleText["There are no vehicles nearby to spray.","PLAIN"];};

if(!(createDialog "Life_spray_shop")) exitWith {hint "There was a problem opening the Spray shop menu."};

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

{
	if(alive _x) then {
		_className = typeOf _x;		
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,(_x getVariable "dbInfo") select 1];
	};
} foreach _nearVehicles1;