scriptName "MP\data\scripts\remExWrite.sqf";
/*
	File: remExWrite.sqf
	Author: Vilem Benes

	Description:
	Remote execution - write. Writes string in public var remExField, which is then interpreted by remExServer.sqf on all clients in MP.
	
	Parameter(s):
	[0] caller object (can be null)
	[1] target object 
	[2] script to execute
	[3] .. [N] data (can be empty / null) -> will be given to remExServer.sqf as array (see _this select 2 in remExServer.sqf)


	Ex.:
	_nul = [player,units group player select 0,"ca/data/scripts/MP/locExObject.sqf","tester.sqf",0,1,256] execVM "ca/data/scripts/MP/remExWrite.sqf";
	
	...executes script tester.sqf on a client, where 'units group player select 0' is a local object
*/

//_version = 2;
//textLogFormat["VDv- remExWrite v%1",_version];	


//textLogFormat["VD17- <%2> remExWrite _this: %1 count: %3",_this,time,count _this];

if (!isNil "BIS_DEBUG_MPF") then 
{
  textLogFormat["MPF_ remExWrite.sqf start %1", _this];
};

if (count _this < 3) exitWith {textLogFormat["MPF_ ERROR: remExWrite.sqf not enough arguments in %1", _this];};

if (isNil "remExField") then {remExField = [];};
if (isNil "remExFP") then {remExFP = [];};

_field = _this;
_callerObject = _field select 0; 	
_targetObject = _field select 1; 

//check if we have nils or objects in arguments 0 and 1
if (!isNil "_callerObject") then {if ((typeName _callerObject) != "OBJECT") exitWith {textLogFormat["MPF_WRITE ERROR: Bad caller object %1 in %2. Not done.",_callerObject, _field];}; };
if (!isNil "_targetObject") then { if (((typeName _targetObject) != "OBJECT") && (typeName _targetObject) != "ARRAY") exitWith {textLogFormat["MPF_ ERROR: Bad target object or array %1 in %2. Not done.",_targetObject, _field];}; };

_targetScript = _field select 2; 


//recognize flags
private ["_persistent","_localExec"];
_localExec = false; _persistent = false;
if (_targetScript == "loc") then {_localExec = true;  _persistent = false;};
if ((_targetScript == "locper") || (_targetScript == "perloc")) then {_localExec = true;  _persistent = true;};
if (_targetScript == "per") then {_localExec = false;  _persistent = true;};


if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ remExWrite.sqf [_targetScript, _localExec, _persistent] %1", [_targetScript, _localExec, _persistent]];};

if (_localExec) then 
{//script (on position 4 in _this is to be executed on client - where _targetObject is local
	if (local _targetObject) then 
	{
    if (count _field < 4) exitWith 
		{		
		  textLogFormat["MPF_ ERROR: remExWrite.sqf not enough arguments in RE call: %1",_field];
		};           
       
    if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ remExWrite.sqf direct execution (local on client) %1", _this]; };
    		   
    if (!_persistent) then 
    {   
      ["",_field] call BIS_MPF_remoteExecutionServer; //call server - stores BIS_MPF_ServerPersistentCallsArray in case this is server
    }
    else
    {}; //persistent execution is common for all branches, see below        
  }
  else
  {//not local here - sending to all clients in network    
    if (_persistent) then
    {
      remExFP = _field;
  	  publicVariable "remExFP"; //communicating over net via publicVariable  	  
  	  textLogFormat ["MPF_ FPL <pV>%1</pV>", remExFP];
    } 
     else
    {      
  	  remExField = _field;
  	  publicVariable "remExField"; //communicating over net via publicVariable
  	  textLogFormat ["MPF_ F L <pV>%1</pV>", remExField];
    };
	
  };
   
}
else
{//multi client execution branch
	//textLogFormat["VD17- <%2> remExWrite remExField: %1",remExField,time];
	
  if (_persistent) then
    {
      remExFP = _field;
  	  publicVariable "remExFP";
  	  textLogFormat ["MPF_ FP  <pV>%1</pV>", remExFP];   	   
  	  //textLogFormat["MPF_ DEBUG0: target: (%1)",["persistent",_field]]; 	
  	  //["persistent",_field] call BIS_MPF_remoteExecutionServer; //call server on calling client (execute wanted script on calling client - where is publicVariable eventhandler not working) - persistent variant  	    	  
    } 
     else
    {      
  	  remExField = _field;
  	  publicVariable "remExField"; 
  	  textLogFormat ["MPF_ F   <pV>%1</pV>", remExField];
  	  ["",_field] call BIS_MPF_remoteExecutionServer; //call server on calling client (execute wanted script on calling client - where is publicVariable eventhandler not working)
    };
};

//persistent execution on server
if (_persistent)  then
//if ((true) || (_persistent)) then //stress test; be aware - it doubles nonpersistent calls
{//all branches need to store persistent calls on server
  if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ persistent call.",_this];};
  ["persistent",_field] call BIS_MPF_remoteExecutionServer; //call server on calling client (execute wanted script on calling client - where is publicVariable eventhandler not working) - persistent variant  	    	    
};

//textLogFormat["VD12- rEWend: %4 %1->%2 %5 remExField (publicVariable-d) is %3.",_this select 0, _this select 1,remExField,_this select 2,_this select 3, _this select 4];



true
