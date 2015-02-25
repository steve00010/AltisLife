StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "teargas.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "nosidechat.sqf";
[] execVM "scripts\zlt_fastrope.sqf";



StartProgress = true;
{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];


