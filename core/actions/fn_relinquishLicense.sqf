/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type", "_action"];
_type = _this select 3;

if( _type == "rebel") then
{
	_action = [
		"Are you sure you want to relinquish your rebel license? <BR/>You will lose all Rebel related Licenses","Relinquish Rebel License","Relinquish","Cancel"
	] call BIS_fnc_guiMessage;
	
	if (_action) then
	{
		[5] call life_fnc_removeLicenses;
	};
	//[[5],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
};

player setVariable["IsRebel", license_civ_rebel,true];