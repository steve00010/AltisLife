private["_vault","_funds","_timer","_toFar"]; 

_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_funds = [_this,1,-1,[0]] call BIS_fnc_param;
_toFar = false; 

if(isNull _vault OR _funds == -1) exitWith {}; //Bad data 
if(player distance _vault > 10) exitWith {[[_vault,-1],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; hint "You were to far away, you need to stay within 10m of the vault!"}; 

if(_funds < 50000) exitWith{[[_vault,-1],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; hint "There wasn't enough funds in the Casino. The raid has failed.";}; 

if(_vault getVariable["Casino_Robbed",false]) exitWith {hint "This Casino has already been robbed. The vault is empty"};

_timer = time + (10 * 60); //Default timer is 10 minutes to rob. 
titleText["Cracking the safe...","PLAIN"]; 
[[2,"$$$ THE CASINO VAULT IS BEING RAIDED!!! $$$"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 

while {true} do 
{ 
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER) 
	_countDown = [(_timer - time),"MM:SS.MS"] call BIS_fnc_secondsToString; 
	hintSilent format["You need to stay within 10m!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)]; 
	
	if(player distance _vault > 10) exitWith {_toFar = true;}; 
	if((round(_timer - time)) < 1) exitWith {}; 
	if(!alive player) exitWith {}; 
	if(life_istazed) exitWith {}; 
	sleep 0.1; 
}; 

_vault setVariable["Casino_Robbed",true,true];

switch(true) do 
{ 
	case (_toFar): 
	{ 
		hint "You went to far from the safe, the robbery has failed!"; 
		[[_vault,0],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; 
	}; 
	
	case (!alive player): 
	{ 
		hint "Because you died the robbery failed."; 
		[[_vault,0],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; 
	}; 
	
	case (life_istazed): 
	{ 
		hint "You were tazed, the robbery has failed!"; 
		[[_vault,0],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; 
	}; 
	
	case ((round(_timer - time)) < 1): 
	{ 
		hint format["You have successfully robbed $%1",[_funds] call life_fnc_numberText]; 
		pbh_life_cash = pbh_life_cash + _funds;
		[[_vault,1,_funds],"TON_fnc_CasinoState",false,false] spawn life_fnc_MP; 
	}; 
};