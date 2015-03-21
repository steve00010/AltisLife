/*
@filename: islandConfig.sqf
Author:

	Quiksilver 
	Last modified 24/10/2014 ArmA 1.30 by Quiksilver (took some of the unused crap out)
Notes:

	WIP

______________________________________________________________________*/

sleep 1;

ammocheck_switch = false;
ammoDropCrate = objNull;
AW_ammoDropAvail = true; publicVariable "AW_ammoDropAvail";
SHK_fnc_buildingPos02 = compileFinal preprocessFileLineNumbers "functions\SHK_buildingpos02.sqf";
sleep 1;

enemyCasArray = [];
enemyCasGroup = createGroup east; 
sleep 0.1; 
deleteGroup enemyCasGroup;

sleep 1;
if ((PARAMS_CasOnStart != 0) && {(PARAMS_CasFixedWingSupport != 0)}) then {
	[] call QS_fnc_casRespawn;
};