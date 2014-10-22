/*
	File: fn_pullOutVehCiv.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(playerSide == west && (vehicle player == player)) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	player action ["Eject", vehicle player];
	titleText["You have been pulled out of the vehicle","PLAIN"];
	titleFadeOut 4;
};

player action ["Eject", vehicle player];
titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;