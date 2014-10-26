/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep", "_curMag"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then 
{
	if(_source != _unit) then 
	{
		_curWep = currentWeapon _source;
		_curMag = currentMagazine _source;
	
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","30Rnd_556x45_Stanag"] && _curWep in ["hgun_P07_snds_F","arifle_TRG20_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "30Rnd_556x45_Stanag") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = damage _unit;
				
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then 
						{
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else 
						{
							// Added check to not taze vehicles.
							if ( !_isVehicle ) then
							{
								[_unit,_source] spawn life_fnc_tazed;
							};
						};
					};
				};
			};
		};
		
		if (_curMag in ["30Rnd_65x39_caseless_mag_Tracer"] && _projectile in ["B_65x39_Caseless"]) then 
		{
			if((side _source == west && playerSide != west)) then 
			{
				private["_isVehicle","_isQuad"];
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf(vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				_damage = damage _unit;
				
				if(_isVehicle && _isQuad) then {
					player action ["Eject",vehicle player];
					[_unit,_source] spawn life_fnc_handleDowned;
				} else 
				{
					if ( !_isVehicle ) then
					{
						[_unit,_source] spawn life_fnc_handleDowned;
					};
				};
			};
			
			if(side _source == west && playerSide == west) then {
				_damage = damage _unit;;
			};
		};
		
		if(_projectile in ["B_127x99_Ball","B_127x99_Ball_Tracer_Red","B_127x99_Ball_Tracer_Green","B_127x99_Ball_Tracer_Yellow"]) then
		{
			systemChat format["Player Health: %1 || Damage From Arma: %2 || Damage Modified: %3 || Damage we Send: %4",damage _unit,_damage,_damage / 25,(damage _unit) + (_damage / 25)];
			_damage = ((damage _unit) + (_damage / 25));
		};
		
		//Temp fix for super tasers on cops.
		if(playerSide == west && side _source == west) then 
		{
			_damage = damage _unit;
		};
		
		if (vehicle _unit == _unit) then
		{
			if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat" ) then
			{
				diag_log "_Source is Vehicle, Not a player driving a vehicle"
			}
			else
			{
				
				_isVehicle = vehicle _source;
				if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then 
				{
					_damage = damage _unit;;
					[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				};
			};
		};
	};

};

[] call life_fnc_hudUpdate;

_damage

