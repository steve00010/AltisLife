/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com - Edited for AltisLife.co.uk
	Date: 14/12/2013
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 4;

sleep 15; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Hello";
_role1names = ["Welcome to","Prophecy Gaming"];
_role2 = "Join us on Teamspeak at!";
_role2names = ["ts3.prophecygaming.co.uk:11377"];
_role3 = "Developed from an idea by Tonic";
_role3names = ["Enhanced by Bruce, Steve and Jock"];
_role4 = "Upgraded to the 4.0 Framework";
_role4names = ["Lots of Custom Scripts"];
_role5 = "Special thanks to";
_role5names = ["All you guys that are part of our great community!<br/>Thankyou!"];
_role6 = "Like our server?";
_role6names = ["Please support us by contributing at prophecygaming.co.uk"];
_role7 = "Enjoy your stay";
_role7names = ["Have fun and follow the rules posted on our website"];
 
{
sleep 8;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
4.0
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names]
];