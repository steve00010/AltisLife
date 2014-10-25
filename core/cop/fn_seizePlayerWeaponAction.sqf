/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
[] call life_fnc_civFetchGear;
[] call SOCK_fnc_updateRequest; //Should make weapon remove persistent
[] call life_fnc_civLoadGear;
titleText["Your weapons were removed/confiscated.","PLAIN"];