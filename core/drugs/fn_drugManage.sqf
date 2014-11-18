/*
	File: fn_drugUsed.sqf
	Author: John "Paratus" VanderZwet / cptjames32 / Steve
	
	Description:
	Drug Overdose
*/
private["_add","_item","_index","_addInc","_over"];

_index = _this select 0;

_addInc = switch (_index ) do
{
	case 0: { 0.05 };
	case 1: { 0.3 };
	case 2: { 0.45 };
};

_add = life_addiction select _index;
if (_add > 0.9) then { life_drug_withdrawl = false; };
_add = _add + _addInc;
if (_add > 1) then { _add = 1; };
life_addiction set [_index, _add];
life_used_drug set [_index, time];

if (life_drug_level > 9) then
{
	_over = random 1;
	if (_over > 0.65) then { [] spawn life_fnc_overdose; };
};