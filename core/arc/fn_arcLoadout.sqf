/*
File: fn_arcLoadout.sqf
Author: Bryan "Tonic" Boardwine
Edited: Itsyuka
 
Description:
Loads the ARC out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
 
//Load player with default arc gear.
player forceAddUniform "U_B_CombatUniform_mcam_worn";
player addBackpack "B_Carryall_mcamo";
 
/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[] spawn life_fnc_customUniforms;
[] call life_fnc_saveGear;