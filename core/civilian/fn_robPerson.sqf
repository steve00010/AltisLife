/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(pbh_life_cash > 0) then
{
	[[pbh_life_cash],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	//[[1,format["%1 has robbed %2 for $%3",_robber getVariable["realname",name _robber],profileName,[pbh_life_cash] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[pbh_life_cash] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	pbh_life_cash = 0;
	//_msg = format["%1 robbed %2"_robber getVariable["realname",name _robber],profileName];
	//[[_msg],"life_fnc_logMSG",false,false] spawn life_fnc_MP; 
}
	else
{
	//[[2,format["%1 doesn't have any money.",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",profileName,false] spawn life_fnc_MP;
};