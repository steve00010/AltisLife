/*
	File: fn_onPlayerDisconnect.sqf
	Author: Vampire
	(onPlayerDisconnected example by [KH]Jman on BIStudio Forums)
	
	Description:
	Deletes Weapon Holders within 5m of the disconnecting player.
*/
private ["_clientId","_unit"]; 
_id = _this select 0; 
_pname = _this select 1; 
_puid  = _this select 2;

[[_puid,0],"life_fnc_setOnline",false,false] spawn life_fnc_MP;


call cleanNearItems;



cleanNearItems = {	
	if (_pname != "__SERVER__") then {
		
		_player = objNull;
		{
			if (getPlayerUID _x == _puid) exitWith
			{
				_player = _x;
			};
		} forEach playableUnits; 
		
		if (!(isNull _player)) then {
			// Player body found, now we can run our code
		
			_player removeWeapon (primaryWeapon _player);
			_player removeWeapon (handGunWeapon _player);

			{
				deleteVehicle _x;
			} forEach nearestObjects [_player, ["GroundWeaponHolder"], 5];
			if(!(isNull player)) then {
				deleteVehicle player;
			} else {
				deleteVehicle _player;
				diag_log format["Player %1 has combat logged while dead.",_pname];
			};
		};
		
	};
};