/* 
* @Author:  DnA
* @Profile: http://steamcommunity.com/id/dna_uk
* @Date:    2014-10-22 12:03:22
* @Last Modified by:   DnA
* @Last Modified time: 2015-01-10 17:34:12
*/

with missionNamespace do {
	[player],""TON_fnc_cleanupRequest"",false,false] call life_fnc_MP;
	//--- Give the player immunity
	player allowDamage false;

	//--- Disable user input
	disableUserInput true;

	//--- Hide chat
	showChat false;

	//--- Hide hint
	hint "";


	//--- Fade volume
	1 fadeSound 0;
	1 fadeMusic 0;
	1 fadeRadio 0;
	1 fadeSpeech 0;

	//--- Fade screen
	cutText [ "", "BLACK", 1 ];
	sleep 1;

	//--- Show sync screen
	_effectID = 1 + floor random 3;
	_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
	_video = [ _videoFile ] spawn BIS_fnc_playVideo;
	playSound ( "Transition" + str _effectID );
	sleep 1;
	0 = [ format [ "<br/><t color='#8e44ad'>%3</t><br/><br/><t size='0.7'>%1 %2.</t>", "We hope to see you again soon", profileName, "SYNCING DATA WITH SERVER" ], 0, 0.2, 2, 0.5, 0, 1000 ] spawn BIS_fnc_dynamicText;

	[] spawn {
		

		//--- Sync user data
		[] call SOCK_fnc_updateRequest;

		sleep 4;

		//--- Enable user input
		disableUserInput false;

		//--- Re-enable chat
		showChat true;

		//--- Abort the mission
		[ "Abort", true, false ] call BIS_fnc_endMission;

	};

};