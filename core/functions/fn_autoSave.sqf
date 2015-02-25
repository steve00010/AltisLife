/*
@Version: 0.3
@Author: =IFD= Cryptonat
@Edited: 5/16/14

Description:
Saves the player's gear every 10 minutes.
*/

while {true} do {
		sleep (600 + random 600); //10 MIN + UPTO 10 MIN EXTRA
		[1] call SOCK_fnc_syncData;
		hint "Data synced to the Prophecy Server, next save in 10-20 minutes.";
};