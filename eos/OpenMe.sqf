EOS_Spawn = compile preprocessfilelinenumbers "scripts\eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "scripts\eos\core\b_launch.sqf";
null=[] execVM "scripts\eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "scripts\eos\Functions\EOS_Markers.sqf";};

/* EOS 1.98 by BangaBob 

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20
*/

VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

//                                                                          House     Patrol    Lt. Veh   Armored     Helo      Faction                        
//
// null = [["EOS_Athira_NW","EOS_Athira_NE","EOS_Athira_SW","EOS_Athira_SE"],[5,2,100],[4,2,100],[2,2,100],[2,50],[0],[0],[0,0,500,EAST,TRUE]] call EOS_Spawn;

// ATHIRA
// light square: 2x House (2,4)
null = [["EOS_Athira_1","EOS_Athira_2"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_Athira_3","EOS_Athira_6"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_Athira_4","EOS_Athira_5"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_Athira_7","EOS_Athira_10"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_Athira_8","EOS_Athira_9"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_Athira_11","EOS_Athira_12","EOS_Athira_13"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory light square: 1x Patrol + 1x Lt. Vehicle
null = [["EOS_Athira_Factory_1"],[0],[3,2,90],[1,1,90],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory heavy square: 1x large Patrol 
null = [["EOS_Athira_Factory_2"],[0],[3,5,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// GRAVIA
// light square: 2x House (2,4)
null = [["EOS_Gravia_1","EOS_Gravia_3","EOS_Gravia_4","EOS_Gravia_5","EOS_Gravia_6","EOS_Gravia_7","EOS_Gravia_8","EOS_Gravia_9"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// square 2 is heavy. house group + patrol group
null = [["EOS_Gravia_2"],[1,1,90],[1,1,90],[1,1,90],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// LAKKA
null = [["EOS_Lakka_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// STAVROS
null = [["EOS_Stavros_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// KATALAKI
null = [["EOS_Katalaki_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// POLIAKKO
null = [["EOS_Poliakko_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// NEOCHORI
// Mid-town patrol. Large. Has armor. Helicopter support. 
null = [["EOS_Neochori_Patrol"],[2,1,90],[2,2,100],[2,2,100],[1,90],[1,90],[1,3,100],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// Rest of Neochori. Light.
null = [["EOS_Neochori_1","EOS_Neochori_2","EOS_Neochori_3","EOS_Neochori_4"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Neochori_5","EOS_Neochori_6","EOS_Neochori_7","EOS_Neochori_8"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// SAGONISI BASE
null = [["EOS_Sagonisi_Base_1"],[2,1,90],[2,2,100],[2,2,100],[1,90],[1,90],[1,3,100],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Sagonisi_Base_2"],[2,1,90],[0],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// TELOS
null = [["EOS_Telos_1","EOS_Telos_2","EOS_Telos_3","EOS_Telos_4","EOS_Telos_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// ANTHRAKIA
null = [["EOS_Anthrakia_1","EOS_Anthrakia_2","EOS_Anthrakia_3","EOS_Anthrakia_4"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// THRONOS CASTLE
// heavy patrol inc. air
null = [["EOS_Thronos"],[2,1,90],[1,3,100],[1,2,100],[0],[0],[1,3,100],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// OREOKASTRO
//patrol
null = [["EOS_Oreokastro"],[2,1,90],[1,3,100],[1,1,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// ALIKAMPOS
null = [["EOS_Alikampos_1","EOS_Alikampos_2","EOS_Alikampos_3","EOS_Alikampos_4"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Alikampos_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// THERISA
null = [["EOS_Therisa_1","EOS_Therisa_2","EOS_Therisa_3","EOS_Therisa_4","EOS_Therisa_5","EOS_Therisa_6","EOS_Therisa_7"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// ZAROS
null = [["EOS_Zaros_1","EOS_Zaros_2","EOS_Zaros_3","EOS_Zaros_4","EOS_Zaros_5","EOS_Zaros_6","EOS_Zaros_7"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Zaros_8","EOS_Zaros_9","EOS_Zaros_10","EOS_Zaros_11","EOS_Zaros_12","EOS_Zaros_13","EOS_Zaros_14","EOS_Zaros_15"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Zaros_16","EOS_Zaros_17","EOS_Zaros_18","EOS_Zaros_19"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// KALITHERA
null = [["EOS_Kalithea_1","EOS_Kalithea_2","EOS_Kalithea_3"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// PANOCHORI
null = [["EOS_Panochori_1","EOS_Panochori_2","EOS_Panochori_3","EOS_Panochori_4","EOS_Panochori_5","EOS_Panochori_6","EOS_Panochori_7"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Panochori_8","EOS_Panochori_9","EOS_Panochori_10","EOS_Panochori_11"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// EDESSA
null = [["EOS_Edessa_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// DAM PATROL
null = [["EOS_Dam_Patrol"],[2,1,90],[2,2,100],[1,3,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// AGIOS DIONYSIOS
null = [["EOS_Agios_Dionysios_1","EOS_Agios_Dionysios_2","EOS_Agios_Dionysios_3","EOS_Agios_Dionysios_4","EOS_Agios_Dionysios_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Agios_Dionysios_6","EOS_Agios_Dionysios_7","EOS_Agios_Dionysios_8","EOS_Agios_Dionysios_9","EOS_Agios_Dionysios_10","EOS_Agios_Dionysios_11"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// FRINI
null = [["EOS_Frini_1","EOS_Frini_2","EOS_Frini_3","EOS_Frini_4","EOS_Frini_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_NWFrini_1","EOS_NWFrini_2"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_NWFrini_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// KORE
null = [["EOS_Kore_1","EOS_Kore_2","EOS_Kore_3","EOS_Kore_4","EOS_Kore_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// ORINO
null = [["EOS_Orino_1"],[2,2,100],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// GALATI
null = [["EOS_Galati_1","EOS_Galati_2","EOS_Galati_3","EOS_Galati_4"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// SYRTA
null = [["EOS_Syrta_1","EOS_Syrta_2","EOS_Syrta_3","EOS_Syrta_4","EOS_Syrta_5","EOS_Syrta_6"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// NEGADES
null = [["EOS_Negades_1","EOS_Negades_2","EOS_Negades_3","EOS_Negades_4","EOS_Negades_5","EOS_Negades_6"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// STADIUM
null = [["EOS_Stadium_Patrol_1"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// WINDMILL
null = [["EOS_Windmill_Patrol"],[2,1,90],[1,2,100],[1,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// ABDERA
null = [["EOS_Abdera_1","EOS_Abdera_2","EOS_Abdera_3","EOS_Abdera_4"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// PANAGIA
null = [["EOS_Panagia_1","EOS_Panagia_2","EOS_Panagia_3","EOS_Panagia_4","EOS_Panagia_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Panagia_6","EOS_Panagia_7","EOS_Panagia_8","EOS_Panagia_9","EOS_Panagia_10","EOS_Panagia_11"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// SELAKANO
null = [["EOS_Selakano_1","EOS_Selakano_2","EOS_Selakano_3","EOS_Selakano_4","EOS_Selakano_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Selakano_6","EOS_Selakano_7","EOS_Selakano_8","EOS_Selakano_9"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// OLD AIRSTRIP
null = [["EOS_OldAirstrip_1","EOS_OldAirstrip_2"],[2,2,100],[2,2,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// FERES
null = [["EOS_Feres_1","EOS_Feres_2","EOS_Feres_3","EOS_Feres_4","EOS_Feres_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Feres_6","EOS_Feres_7","EOS_Feres_8","EOS_Feres_9"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// Chalkeia
null = [["EOS_Chalkeia_1","EOS_Chalkeia_2","EOS_Chalkeia_3","EOS_Chalkeia_4","EOS_Chalkeia_5"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Chalkeia_6","EOS_Chalkeia_7","EOS_Chalkeia_8"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// FACTORY NEAR BASE
null = [["EOS_FactoryNearBase"],[2,2,100],[2,2,90],[2,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

// FACTORY NEAR KORE
null = [["EOS_FactoryNearKore"],[2,2,100],[2,2,90],[2,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

//
null = [["EOS_Aggelochori_1","EOS_Aggelochori_2","EOS_Aggelochori_3"],[2,2,100],[2,2,90],[2,2,100],[2,90],[2,90],[1,3,90],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Kavala_1","EOS_Kavala_2","EOS_Kavala_3","EOS_Kavala_4"],[2,2,100],[2,2,90],[2,2,100],[2,90],[2,90],[1,3,90],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Power_Plant_Patrol"],[2,2,100],[2,2,90],[2,2,100],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Abandoned_Airstrip"],[2,2,100],[2,2,90],[2,2,100],[0],[0],[1,3,100],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Neri_1"],[2,2,100],[2,2,90],[2,2,100],[2,90],[2,90],[1,3,50],[0,0,500,EAST,FALSE]] call EOS_Spawn;

null = [["EOS_South_Island_Windturbine_Patrol_1"],[0],[2,2,90],[2,2,100],[1,100],[1,100],[1,3,100],[0,0,500,EAST,FALSE]] call EOS_Spawn;

null = [["EOS_Pyrgos_1","EOS_Pyrgos_2","EOS_Pyrgos_3","EOS_Pyrgos_4"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Charkia_1","EOS_Charkia_2","EOS_Charkia_3"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Kalochori_1","EOS_Kalochori_2"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Rodopoli_1","EOS_Rodopoli_2"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Dorida_1"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Paros_1","EOS_Paros_2"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Pefkas_Bay_1"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Desert_Strip_1"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;


null = [["EOS_Base_Near_Sofia"],[2,1,90],[2,1,90],[1,1,100],[1,90],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Molos_Airfield"],[2,1,90],[2,1,90],[1,1,100],[1,90],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Iraklia_1"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Molos_1","EOS_Molos_2"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
null = [["EOS_Sofia_1","EOS_Sofia_2"],[2,1,90],[2,1,90],[1,1,100],[0],[1,90],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;

//
// null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;
//
