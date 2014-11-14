enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "teargas.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "nosidechat.sqf";
[] execVM "scripts\zlt_fastrope.sqf";

StartProgress = true;
{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "core\functions\fn_onPlayerDisconnect.sqf" };

//For Rain and Fog Gone Below <----------- Here 


MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};
while {true} do
{
	sleep 100;
	0 setFog 0;
};