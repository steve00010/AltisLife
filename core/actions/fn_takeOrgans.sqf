/*
	file: fn_takeOrgans.sqf
	author: [midgetgrimm] - www.grimmlife.com
	
	taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //if unit is null, than NO
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {};//must not be missing organ already
if((player getVariable ["hasOrgan",FALSE])) exitWith {};//thief must not have already robbed an organ within last 5 mintues
if((animationState _unit != "Incapacitated")) exitWith {};//victim must be knocked out
if(!([false,"surgeryknife",1] call life_fnc_handleInv)) exitWith {hint "You dont have a Surgery Knife"};
if(player == _unit) exitWith {};//if the thief is the cursor target(dafuq) than NO
if(!isPlayer _unit) exitWith {};//iff the cursor target is not a player than NO

if ( (_unit getVariable ["KidneyTheftInProgress", false]) )exitWith { hint "Someone is already harvesting this victim!" };
_unit setVariable["KidneyTheftInProgress",true,true];

if(life_inv_kidney >= 1) exitWith {hint "You can't possibly need that many organs!"; _unit setVariable["KidneyTheftInProgress",false,true];};//if you already have 2 kidneys, then go sell them already, no stockpiling

life_action_inUse = true;//sets action to true as to prevent kidney spammming!!!!!!!!


//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["You are stealing a kidney, don't move! (1%1)...","%"];;
_progressBar progressSetPosition 0.01;
_cP = 0.01;


while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.16;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["You are stealing a kidney, don't move! (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	
};




5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR (player getVariable["restrained",false]) OR life_interrupted) then {
	life_interrupted = false; 
	titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; 
	life_action_inUse = false;
	_unit setVariable["KidneyTheftInProgress",false,true];
} else {
	if(!([true,"kidney",1] call life_fnc_handleInv)) exitWith {hint "You don't have room to store any organs!";
	_unit setVariable["KidneyTheftInProgress",false,true];};//if no room for kidney, you cannot take their kidney, duh, waste not want not
	player setVariable["hasOrgan",true,true];//sets variable on thief, so as not to consistently take organs, set to 5 minute cooldown
	_unit setVariable["missingOrgan",true,true];//sets the missing organ variable so effects can take place
	life_action_inUse = false;//once variables are set, and actions stop, then you can use scrolly wheely
	[[player], "life_fnc_hasOrgan", _unit, false] spawn life_fnc_MP;//this then calls the fn_hasOrgan.sqf on the thief
	
	_msg = format["%1 took %2's organ",profileName,_unit getVariable["realname", _unit]];
	[[_msg],"life_fnc_logMSG",false,false] spawn life_fnc_MP;
};
