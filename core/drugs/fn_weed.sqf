/*
    File: fn_weed.sqf
    Author: Kuchiha

    Description:
    Marijuana effects.
*/
life_drug_level = life_drug_level + 1;
if (life_drug_level > 10) then { life_drug_level = 10; };

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
hint "420 Blaze it!";
sleep 3;
[0] call life_fnc_drugManage;
//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
    
//Let's go for 45secs of effetcs
for "_i" from 0 to 45 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep 1;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;

[] call life_fnc_hudUpdate;
