EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

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
null = [["EOS_1","EOS_2"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_3","EOS_6"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_4","EOS_5"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_7","EOS_10"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_8","EOS_9"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_11","EOS_12","EOS_13"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory light square: 1x Patrol + 1x Lt. Vehicle
null = [["EOS_13"],[0],[3,2,90],[1,1,90],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory heavy square: 1x large Patrol 
null = [["EOS_14"],[0],[3,5,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_15","EOS_16"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_17","EOS_18"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_19","EOS_20"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_21","EOS_22"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_23","EOS_24"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_25","EOS_26","EOS_27"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory light square: 1x Patrol + 1x Lt. Vehicle
null = [["EOS_28"],[0],[3,2,90],[1,1,90],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory heavy square: 1x large Patrol 
null = [["EOS_29"],[0],[3,5,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_30","EOS_31"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_32","EOS_33"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_34","EOS_35"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_36","EOS_37"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// heavy square: 3x House (2,4)
null = [["EOS_38","EOS_39"],[3,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_40","EOS_41","EOS_42"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory light square: 1x Patrol + 1x Lt. Vehicle
null = [["EOS_43"],[0],[3,2,90],[1,1,90],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// factory heavy square: 1x large Patrol 
null = [["EOS_44"],[0],[3,5,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;
// light square: 2x House (2,4)
null = [["EOS_45"],[2,1,90],[2,1,90],[0],[0],[0],[0],[0,0,500,EAST,FALSE]] call EOS_Spawn;


//
// null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;
//
