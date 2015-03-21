//server sends commands from persistent array to given client (redones these calls - targetting this client)
//by Vilem

scriptName "MP\data\scripts\JIPserverSendCommands.sqf";
_targetClient = _this select 0;


textLogFormat["MPF_ %1 Server: JIPSSC _targetClient: (%2)",BIS_DEBUG_MPF_SERVERORCLIENT,_targetClient]; 	 

//if {isNil BIS_MPF_ServerPersistentCallsArray} exitWith {};

private["_i"];
for [{_i=0},{_i< count BIS_MPF_ServerPersistentCallsArray},{_i = _i+1}] do
{//remEx all persistent commands //persistent flag means no harm - server never listens to JIPserverSendCommands  
  [nil, _targetClient,"loc", rJIPEXEC, BIS_MPF_ServerPersistentCallsArray select _i] call RE;   
  
  if (!isNil "BIS_DEBUG_MPF") then 
  {    
    textLogFormat["MPF_ JIPSSC.sqf: %1", [nil, _targetClient, rJIPEXEC, BIS_MPF_ServerPersistentCallsArray select _i]];
  };
};