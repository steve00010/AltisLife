#include <macro.h>
/*
	File: fn_chopShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private["_control","_selection","_price","_priceTag","_colorArray","_skin","_skinI","_vehicle","_className","_vIndex"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,-1,[0]] call BIS_fnc_param;

//Error checks
if(isNull _control OR _selection == -1) exitWith {};

_className = _control lbData _selection;
_vIndex = lbValue[2302,(lbCurSel 2302)];
ctrlShow [2330,true];
ctrlShow [2304,true];

_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,__className,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"garageSell"),4)};
};
_price = round (_price / 3);
_nearVehicles = nearestObjects[getPos (player),["Car","Air","Truck"],25]; //Fetch vehicles within 30m.
if(count _nearVehicles > 0) then
	{
		{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((_x getVariable "dbInfo") select 1 == _vIndex) exitWith
			{
				_vehicle = _x;
			};
			if((getPlayerUID player) == _vehOwner) then {
				[_x,_x getVariable "OColor"] spawn life_fnc_colorVehicle;
			};
			
		};
	} foreach _nearVehicles;
};

_skinI = _vehicle getVariable "Life_VEH_color";
_skin = SEL(SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures"),_skinI),0);
CONTROL(2300,2303) ctrlSetStructuredText parseText format["Spray Price: <t color='#8cff9b'>$%1</t><br/>Current Skin: <t color='#8cff9b'>%2</t>", _price,_skin];


_ctrl = CONTROL(2300,2304);
lbClear _ctrl;
_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures");

{	 
	if(_x select 1 == "civ") then 
	{
		_ctrl lbAdd format["%1",_x select 0];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} forEach _colorArray;