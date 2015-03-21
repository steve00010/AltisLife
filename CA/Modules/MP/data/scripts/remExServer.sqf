scriptName "MP\data\scripts\remExServer.sqf";
/*
	File: remExServer.sqf
	Author: Vilem Benes

	Description:
	Event handler that serves remote execution calls that are done via publicVariable. (See remExWrite for more details).
	
	Executes scripts on clients in network.

	Parameter(s):
	 _this select 0 .. name of public variable ("remExField" / "remExFP") or flags ("" / "persistent" -> store into);
*/

private["_error"];
_error = false;

if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ remExServer.sqf start %1", _this];};
if (count _this < 2) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf not enough arguments in RE call (%1)",_this];};

private["_persistent"];
//remExServer.sqf can be executed either directly or by pV EH 
if ((_this select 0 == "persistent") || (_this select 0 == "remExFP")) then {_persistent = true;} else {_persistent = false;};
_field = _this select 1;

if (count _field < 3) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf not enough arguments in RE call (%1)",_this];};

_callerObject = _field select 0; 	
_targetObject = _field select 1; 
_targetScript = _field select 2; 

private ["_localExec"];
_localExec = false; 
if ((_targetScript == "loc") || (_targetScript == "locper") || (_targetScript == "perloc")) then {_localExec = true};

if (_localExec) then
{//script (on position 4 in _field) is to be executed on client, where _targetObject is local
	if (local _targetObject) then 
	{//we are the client where _target object is local
    if (count _field < 4) exitWith 
		{		
		  textLogFormat["MPF_ ERROR: remExServer.sqf not enough arguments in RE call: %1",_field];
		  _error = true;
		};
		
		_targetScript = _field select 3;		
		
		if (isNil "_targetScript") exitWith 
		{		
		  textLogFormat["MPF_ ERROR: remExServer.sqf invalid RE script name (%1) (see MPframework.sqf)",_targetScript];
		  _error = true;
		};
		
		//prepare data
		_data = [];
		
		if !(isNil {_callerObject}) then {_data = _data + [_callerObject];} else {_data = _data + [nil];};
		if !(isNil {_targetObject}) then {_data = _data + [_targetObject];} else {_data = _data + [nil];};
		
		private ["_x"];
		for [{_x=4},{_x<count _field},{_x=_x+1}] do 
		{_data = _data + [_field select _x]};
	  
		//execute wanted script
    private ["_code"];		
		_code = call compile format["r%1code",_targetScript];	
		//textLogFormat["MPF_ (%1) 0 remExServer.sqf - RE call - target %2 - (field: %3) (Bad script name?)",BIS_DEBUG_MPF_SERVERORCLIENT,_targetScript,_field];	
		if (isNil {_code}) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf - wrong RE call (%1) (Bad script name?)",_field];};
		if ((typename _code) != (typename {})) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf - wrong RE call (%1) (Bad script name?)",_field];};
		_data call _code;		  			
  };
}
else
{//not local exec   
  _data = [];	
  if (isNil "_callerObject") then {_data = _data + [nil];} else {_data = _data + [_callerObject];};
	if (isNil "_targetObject") then {_data = _data + [nil];} else {_data = _data + [_targetObject];};
  if (isNil "_targetScript") exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf invalid RE script name (see MPframework.sqf)"];	_error = true;};
		
  if (_targetScript == "per") then 
  {//"per" flag, we need to seek script name on next position		
	  if (count _field < 4) exitWith 
		{		
		  textLogFormat["MPF_ ERROR: remExServer.sqf not enough arguments in RE call: %1",_field];
		  _error = true;
		};
		
		_targetScript = _field select 3;		
		private ["_x"];
		for [{_x=4},{_x<count _field},{_x=_x+1}] do {_data = _data + [_field select _x]};
	}
	else
	{
	  private ["_x"];
	  for [{_x=3},{_x<count _field},{_x=_x+1}] do {_data = _data + [_field select _x]};
	};
		

  if (!isNil "BIS_DEBUG_MPF") then
    {
    //textLogFormat["MPF_ remExServer NLE caller %1 target %2 data %3  (_this %4)",_callerObject, _targetObject, _data, _this]; 	 
	  };
	  
	  //execute wanted script
	  
	 	if (isNil "_targetScript") exitWith 
		{		
		  textLogFormat["MPF_ ERROR: remExServer.sqf invalid RE script name (%1) (see MPframework.sqf)",_targetScript];
		  _error = true;
		};
	  
    private ["_code"];		
		_code = call compile format["r%1code",_targetScript];		
		//textLogFormat["MPF_ %1", _code];			
		//textLogFormat["MPF_ (%1) 1 remExServer.sqf - RE call - target %2 - (field: %3) (Bad script name?)",BIS_DEBUG_MPF_SERVERORCLIENT,_targetScript,_field];			
		if (isNil {_code}) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf - wrong RE call (%1) (Bad script name?)",_field];};
		if ((typename _code) != (typename {})) exitWith {textLogFormat["MPF_ ERROR: remExServer.sqf - wrong RE call (%1) (Bad script name?)",_field];};
		_data call _code;		
};
			
if (_persistent) then
{//collect executed "per" calls & store them (to prevent their reusing when executing JIP sequence for client)
	if (time < 20) then
	{
		BIS_MPF_JIPpreventDouble = BIS_MPF_JIPpreventDouble + [_field];
		if (!isNil "BIS_DEBUG_MPF") then 		{ 			textLogFormat["MPF_JIP-double adding (%1):  %2 to BIS_MPF_JIPpreventDouble",time,_field];		};
		//textLogFormat["MPF_JIP-double adding: BIS_JIPremExField now: %1",BIS_JIPremExField];
	}
	else
	{
		if (!isNil "BIS_DEBUG_MPF") then 		{ 			textLogFormat["MPF_JIP-double (%1):  BIS_MPF_JIPpreventDouble = []; (_field: %2)",time,_field];		};
		BIS_MPF_JIPpreventDouble = [];
	};
};

//Store persistent array - only on server (special server-side flag before RE array for recognizing)
if ((_persistent) && (!_error) && (isServer)) then
{//store persistent commands on server
  private["_i","_newCallArray","_entry"];
  _newCallArray = [];    
  BIS_MPF_ServerPersistentCallsArray = BIS_MPF_ServerPersistentCallsArray +[_field];
   
  if (!isNil "BIS_DEBUG_MPF") then 
  {
    textLogFormat["MPF_ PERSISTENT ARRAY - count %1", count BIS_MPF_ServerPersistentCallsArray];        
    private["_i"];
    for [{_i=0},{_i<count BIS_MPF_ServerPersistentCallsArray}, {_i=_i+1}] do {textLogFormat["MPF_ -PERSISTENT:   %1", BIS_MPF_ServerPersistentCallsArray select _i];};                
  };
};

if (!isNil "BIS_DEBUG_MPF") then {textLogFormat["MPF_ remExServer.sqf start %1", _this];};