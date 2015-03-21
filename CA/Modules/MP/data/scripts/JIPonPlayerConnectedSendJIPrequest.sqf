//sends request (processed by server) for sending of persistent calls 
//by Vilem


scriptName "MP\data\scripts\JIPonPlayerConnectedSendJIPrequest.sqf";
textLogFormat["MPF_CLIENT O:\arma\ca\Modules\MP\data\scripts\JIPonPlayerConnectedSendJIPrequest.sqf",_this]; 
 
if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ JIPonPCJIPR.sqf XXXZ request %1", [BIS_MPF_clientJIPlogic,nil,rJIPREQUEST]]; };    
waitUntil{!isNil {RE}};
waitUntil{!isNil {rJIPREQUEST}};

waitUntil {local player};
BIS_MPF_clientJIPlogic = player;
  
nic = [BIS_MPF_clientJIPlogic,nil,rJIPREQUEST] call RE;





