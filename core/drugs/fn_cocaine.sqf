/*
    File: fn_weed.sqf
    Author: Steve

    Description:
    Cocaine effect.
*/

//Close inventory
closeDialog 0;

life_drug_level = life_drug_level + 2;
if (life_drug_level > 10) then { life_drug_level = 10; };


[] spawn
{
	life_cocaine_effect = time;
	systemChat "Wow, you feel like you could run a marathon!";
	player setFatigue 0;
	player enableFatigue false;
	waitUntil {!alive player OR ((time - life_cocaine_effect) > (5 * 60))};
	life_cocaine_effect = 0;
	player enableFatigue true;
	if(alive player) then {
		systemChat "Urgh, the comedown...";
		player setFatigue 1;
	};
};

[] call life_fnc_hudUpdate;
[1] call life_fnc_drugManage;