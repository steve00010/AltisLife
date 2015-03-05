/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit", "_ziptied"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if (side player == civilian OR side player == east ) then 
{
	if(life_inv_zipties < 1) then 
	{
		_ziptied = false; 
	}
	else
	{
		_ziptied = true;
		life_inv_zipties = life_inv_zipties - 1;
		_unit setVariable["ziptied",true,true];
		hint "You have ziptied the citizen";
	}
};

if ((!_ziptied) && ((side player == civilian) OR (side player == east))) exitWith { hint "You have no zipties."; };
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; 


_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;