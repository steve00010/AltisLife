//processed by server - client calls for sending JIP calls from server


scriptName "MP\data\scriptCommands\JIPrequest.sqf";
_caller = _this select 0; //object local on requesting client

textLogFormat["MPF_ %1 JIPREQ _targetClient: (%2) local %3",BIS_DEBUG_MPF_SERVERORCLIENT,_caller, local _caller]; 	 

if (isServer) then
{
  textLogFormat["MPF_ %1 JIPREQ caller %2 script %3",BIS_DEBUG_MPF_SERVERORCLIENT, _caller, BIS_MP_Path + BIS_PATH_SQF + "JIPserverSendCommands.sqf"]; 
  
  _nic = [_caller] execVM BIS_MP_Path + BIS_PATH_SQF + "JIPserverSendCommands.sqf";
  
  if (!isNil "BIS_DEBUG_MPF") then { textLogFormat ["MPF_ JIPrequest caller %1  executing:  %2", BIS_MP_Path + BIS_PATH_SQF + "JIPserverSendCommands.sqf"];};
  textLogFormat ["MPF_Client >>> JIPrequest caller %1  executing:  %2", BIS_MP_Path + BIS_PATH_SQF + "JIPserverSendCommands.sqf"];
};