/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
	
		//Seize Items      
		life_actions = life_actions + [player addAction["Seize Player Weapon",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		life_actions = life_actions + [player addAction["Seize Objects",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];  
		// nano EMP Little Bird
		life_actions = life_actions + [player addAction["<t color='#FF0000'>EMP Operator Console Open</t>",life_fnc_openEmpMenu,[],8,false,false,"",'[_this] call life_fnc_isEmpOperator']];
    };

	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Rob Person",life_fnc_robPerson,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE]) ']];
		life_actions = life_actions + [player addAction["Vehicle Garage",life_fnc_vehicleGarage,"car",0,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || ((cursorTarget getVariable["life_locked", 1]) == 0)) ']];
        life_actions = life_actions + [player addAction["Store Vehicle in Garage",life_fnc_storeVehicle,"""",0,false,false,"""",
        ' !life_garage_store && !isNull cursorTarget && (player distance cursorTarget) < 20 && license_civ_home && cursorTarget isKindOf "House" && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || (cursorTarget getVariable["life_locked", 1]) == 0) ']];
		/*life_actions = life_actions + [player addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",
        '!isNull cursorTarget && vehicle player == player && (player distance cursorTarget) < 4 && (cursorTarget isKindOf "Land_Atm_01_F" || cursorTarget isKindOf "Land_Atm_02_F")']];
		life_actions = life_actions + [player addAction["Banking Insurance ($1,000)",{if(pbh_life_atmcash > 1000) then {life_has_insurance = true; pbh_life_atmcash = pbh_life_atmcash - 1000};},"",0,false,false,"",
        '!isNull cursorTarget && !life_has_insurance && (player distance cursorTarget) < 4 && (cursorTarget isKindOf "Land_Atm_01_F" || cursorTarget isKindOf "Land_Atm_02_F")']];
		life_actions = life_actions + [player addAction["WHATS THE DATA",{diag_log format["THIS IS THE DATA : %1",cursorTarget]},"",0,false,false,"",
        '']];*/
		// take them organs
		life_actions = life_actions + [player addAction["Harvest Organs",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
		

	
	};
};
