scriptName "MP\data\scripts\MPframework.sqf";
/*

 Multiplayer Framework Init
  by Vilem
  
  
  Usage: 

*/

BIS_MP_Path = "ca\Modules\MP\"; //"
BIS_PathMPscriptCommands = BIS_MP_Path + "data\scriptCommands\"; //"
BIS_PathMPscriptCommandsCustom = BIS_MP_Path + "data\scriptCommandsCustom\"; //"
BIS_PATH_SQF = "data\scripts\"; //"
BIS_MPF_remoteExecutionServer = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "remExServer.sqf"); //used automatically
BIS_MPF_JIPwaitFor = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "JIPwaitFor.sqf"); //function defined (existence of this function is checked and it is then used to wait for JIP in scripts)

BIS_MPF_JIPpreventDouble = []; //for preventing of double execution of per commands if clients connected from begginning (& catching per commands directly and also from server (JIP mechanism))

if (!isNil "BIS_MPF_ONLYONCE") exitWith {};
BIS_MPF_ONLYONCE = "defined";

//BIS_DEBUG_MPF = "def";


if (isServer) then {BIS_DEBUG_MPF_SERVERORCLIENT = "(server)";} else {BIS_DEBUG_MPF_SERVERORCLIENT = "(c)";};

[] spawn {
	//clients wait for JIP (player is player)
	waitUntil {!isNil {BIS_MPF_JIPwaitFor}};
	[] call BIS_MPF_JIPwaitFor; //clients wait until player is player
	
	//launch initJIP.sqf only once
	if (!isNil {BIS_initJIPsqfLaunched}) exitWith {}; 
	BIS_initJIPsqfLaunched = "defined";
	
	[] execVM BIS_MP_Path+ "data\initJIPcompatible.sqf"; //execute init script (including JIP clients - will launch init.sqf if not launched already)
};

//if (!isServer) then {textLogFormat['PRELOAD_ FIXME:TODO:HACK client endLoa dingScreen (MP) MPF Sleeping'];endLoa dingScreen;Sleep 0.01;};
if (isServer && !isNil "BIS_MPF_ServerInitDone") exitWith {};  //already initialized and started
if (!isServer && !isNil "BIS_MPF_ClientInitDone") exitWith {}; //already initialized and started

if (!isNil {BIS_MPF_initDone}) then {if (BIS_MPF_initDone) exitWith {textLogFormat["MPF_ MPFframework.sqf BIS_MPF_initDone nonnil -> Exitting!%1", _this];};};

//synchronize when connecting to game
if (!isNil "BIS_MPF_dummycenter") exitWith {};

textLogFormat["MPF_PRELOAD_ %1 MPFramework.sqf starting...",BIS_DEBUG_MPF_SERVERORCLIENT];
	
if (isServer) then
{//server init	
  if (isNil "BIS_MPF_ServerInitDone") then 
  { 
    BIS_MPF_ServerInitDone = true;
    createcenter sidelogic;
    
    
    BIS_MPF_dummygroup = createGroup sideLogic;
    
    
    
    
    
    
    BIS_MPF_logic = BIS_MPF_dummygroup createUnit ["Logic", [1000,10,0], [], 0, "NONE"];
    publicVariable "BIS_MPF_logic";  	
    
    if (!isNil "BIS_DEBUG_MPF") then 
    {
      textLogFormat["MPF_ Server init (ONLY ONCE or bad)"];        
    };
        
    BIS_MPF_ServerPersistentCallsArray = [];        
  };
};

//Scripting commands (use prefix r in MPF call (rHINT), see ca\Modules\MP\data\scriptCommands for scripts that are called)
//example: [nil,nil,rHINT, "Hello world"] call RE;

_library = [
"move", 
"moveIn", 
"land", 
"addWPCur", //takes object and for his group on his local sets current WP
"animate", 
"setDate", 
"playmusic", 
"playsound", 
"switchmove", 
"playmove", 
"playmovenow", 
"playAction", 
"playActionnow", 
"switchAction", 
"hint", 
"hintC", 
"showCommandingMenu", 
"globalChat", 
"globalRadio", 
"sideChat", 
"sideRadio", 
"groupChat", 
"groupRadio", 
//"vehicleChat", 
"kbAddTopic", 
"kbRemoveTopic", 
"kbtell", 
"kbreact", 
"deleteWP", 
"setWPdesc", 
"setWPtype", 
"setGroupID",
"createSimpleTask", 
"taskHint",
"createDiaryRecord", 
"removeAllWeapons", 
"addWeapon", 
"addWeaponCargo", 
"addMagazine", 
"addMagazineCargo", 
"clearMagazineCargo",
"clearWeaponCargo",
"endMission",
"failMission",
"titleCut", 
"titleText", 
//"cutText", 
"say", 
"playMusic", 
"switchCamera", 
//"setMusic", 
//"fadeSound", 
"fadeMusic", 
"fadeSound", 
"addAction", 
"removeAction", 
"setCaptive", 
"setDir", //caution: works weird (often overwritten by server, tied to setpos)
"setObjectTexture",
"execfsm", 
"execfsm", 
"execVM", 
"spawn", 
"JIPrequest", //requesting JIP (RE persistent commands) from server by executing this via RE (on server) - parameter: logic local on client
"JIPexec", // custom scripting functions

"addAction", 
"skiptime", //bad
///
/// ! CAUTION - following are not working exactly like engine!
///
"setSimpleTaskDescription", 
"setSimpleTaskDestination", 
"setCurrentTask", 
"setCurrentTaskArrays", 
"createTaskSet", 
"setTaskState",
"debugLog",
"enablesimulation",
"addEventhandler",
"createMarkerLocal",
"setMarkerPosLocal",
"hideObject"
]; 

_libraryCustom = 
[
"callVar"
];


///READ LIBRARY, prepare r commands and r command codes
private["_i"];
for [{_i=0}, {_i< count _library}, {_i = _i +1}] do
{
  _name = "r"+ (_library select _i);  
  call compile format ["%1 = '%2'",_name, (_library select _i)]; //define r commands (rHINT, rSETDATE etc.)
  call compile format ["%1code = compile PreprocessFile (BIS_PathMPscriptCommands + '%2.sqf')",_name, (_library select _i)]; //compile code into rHINTcode, rSETDATEcode
};

for [{_i=0}, {_i< count _libraryCustom}, {_i = _i +1}] do
{
  _name = "r"+ (_libraryCustom select _i);  
  call compile format ["%1 = '%2'",_name, (_libraryCustom select _i)]; //define r commands (rHINT, rSETDATE etc.)
  call compile format ["%1code = compile PreprocessFile (BIS_PathMPscriptCommandsCustom + '%2.sqf')",_name, (_libraryCustom select _i)]; //compile code into rHINTcode, rSETDATEcode
};



//usage: _nic = [nil,nil,rHINT,"Going to briefing."] call RE; - remote execution of hint.sqf (see rHINT def below) on clients
RE = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "remExWrite.sqf");



//JIP - 
if ((!isServer) && (isNil "BIS_MPF_ClientInitDone")) then
{
  BIS_MPF_ClientInitDone = true;    
  
  [] spawn
  {    
    scriptName "MPframework.sqf-JIP";
    private["_script"];
    textLogFormat ["MPF_Client JIPwaitFor.sqf..."];
    _script = [] execVM (BIS_MP_Path + BIS_PATH_SQF + "JIPWaitFor.sqf");     
    waitUntil {(scriptDone _script)};  //wait for JIP or do not start RE processign (see public var EH below)      
    textLogFormat ["MPF_Client JIPwaitFor.sqf... done"];

    "remExField" addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer};
    "remExFP" addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer};
    
    textLogFormat ["MPF_Client JIPonPlayerConnectedSendJIPrequest.sqf..."];       
    _script = [] execVM (BIS_MP_Path + BIS_PATH_SQF + "JIPonPlayerConnectedSendJIPrequest.sqf"); //call for JIP persistence 
    waitUntil {(scriptDone _script)};  //wait for JIP or do not start RE processign (see public var EH below)
    
    textLogFormat ["MPF_Client JIPonPlayerConnectedSendJIPrequest.sqf... sent"];
    
    //TODO rly wait for all sent
    textLogFormat ["MPF_Client JIPonPlayerConnectedSendJIPrequest.sqf... done"];

      
    
    BIS_MPF_ClientJIPDone = true;
    //
  };
}
else
{
  //textLogFormat["MPF_: isServer or Client already initialized - Skipping JIPonPlayerConnectedSendJIPrequest. %1 %2",_this, time];
  "remExField" addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer};
  "remExFP" addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer};
};




//last lines - set BIS_MPF_InitDone flag
[] spawn
{
  if (!isServer) then 
  {
    textLogFormat ["MPF_ Client waiting for BIS_MPF_ClientJIPDone."];
    WaitUntil {!isNil "BIS_MPF_ClientJIPDone"};
    textLogFormat ["MPF_ Client BIS_MPF_ClientJIPDone is true."];
  };
    
  BIS_MPF_InitDone = true;     
  //textLogFormat ["MPF_ Init complete (including JIP if client)."];
  //textLogFormat ["MPF_ rEXECFSM: %1", [rEXECFSM, RE]];
};

textLogFormat["MPF_PRELOAD_ %1 MPFramework.sqf finished...", BIS_DEBUG_MPF_SERVERORCLIENT];