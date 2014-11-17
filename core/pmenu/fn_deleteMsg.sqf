#include <macro.h>
/*

	file: fn_deletemsg.sqf
	Author: Steve
	
*/
private["_index","_data","_status"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;
_data = call compile (_cMessageList lnbData[_index,0]);
_msg = _data select 2;
[[player,_msg],"TON_fnc_removeMsg",false,false] spawn life_fnc_MP;
_cMessageList lnbDeleteRow _index;
