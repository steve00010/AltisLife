#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"], 50];
_units = _units - [player];

{
	private["_name", "_text", "_icon", "_hasName"];
	_name = _x getVariable ["realname", name _x];
	_hasName = if(!isNil {(_x getVariable "realname")}) then {true} else {false};

	_idc = _ui displayCtrl (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};

		_sPos = worldToScreen _pos;
		_distance = _pos distance player;

		if(count _sPos > 1 && {_distance < 25}) then {
			_text = "";
			_icon = "";

			switch (true) do {
				//My Group
				case (_x in (units grpPlayer) && playerSide == civilian): {
					_text = format["<t color='#00FF00'>%1</t>", _name];
				};

				//Dead Players
				case (!alive _x): {
					_text = format["<t color='#000000'>%1</t>", _name];
				};
				if (_x getVariable["Talking", false]) then
				{
					//Diag_log "Player is talking"; 
					_name = format["%1 (Talking)", _name];
					//Diag_log _name; 
				};
				//Cops
				case(_x getVariable["rank", 0] > 0) : {
					switch (_x getVariable["rank", 0]) do {
						case (1) : {_name = format["Cadet %1", name _x];_icon = "images\ranks\PVT.png";};
						case (2) : {_name = format["Officer %1", name _x];_icon = "images\ranks\PFC.png";};
						case (3) : {_name = format["Corporal %1", name _x];_icon = "images\ranks\CPL.png";};					
						case (4) : {_name = format["Sergeant %1", name _x];_icon = "images\ranks\SGT.png";};
						case (5) : {_name = format["Lieutenant %1", name _x];_icon =  "images\ranks\1LT.pnga";};
						case (6) : {_name = format["Captain %1", name _x];_icon =  "images\ranks\CPT.png";};
						case (7) : {_name = format["Chief %1", name _x];_icon =  "images\ranks\GA.png";};
						default {_name = name _x; _icon = ""; _width = 0; _height = 0;}
					};
					
					_text = format["<img image='%2' size='1'></img><t color='#0000FF'> %1</t>", _name, _icon];
				};

				//Medics
				case(_x getVariable["medlevel", 0] > 0): {
					_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa";
					_name = format["Medic %1",name _x];
					_text = format["<img image='%2' size='1'></img><t color='#FF0000'> %1</t>", _name, _icon];
				};
			

				//Others
				default {
					//Others with gang
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						_groupname = (group _x) getVariable ["gang_name",""];
						_text = format["<t color='#B6B6B6'>%1</t><br/><t size='0.8' color='#B6B6B6'>%2</t>", _name, _groupname];
					//Normaly Civilians
					} else {
						_text = format["<t color='#FFFFFF'>%1</t>", _name];
					};
				};
				
			};

			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units; 