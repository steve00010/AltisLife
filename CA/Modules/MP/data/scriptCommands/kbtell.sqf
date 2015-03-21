scriptName "MP\data\scriptCommands\kbtell.sqf";
_caller = _this select 0;
_target = _this select 1;

_receiver = _this select 2;
_topic = _this select 3;
_sentence = _this select 4;

_lower = TRUE;
if (count _this > 5) then {if (typeName (_this select 5) == "BOOL") then {_lower = _this select 5}};

//procedure for automatic weapon lowering
_checkLowering = {
	_fov = 90 - ((_target distance _receiver) * 6);
	if ((isPlayer _target || isPlayer _receiver) && _target != _receiver && side _target getFriend side _receiver > 0 && _target distance _receiver <= 10 && vehicle _target == _target && (if (isPlayer _target) then {[position _target, direction _target, _fov, position _receiver] call BIS_fnc_inAngleSector} else {FALSE} || if (isPlayer _receiver) then {[position _receiver, direction _receiver, _fov, position _target] call BIS_fnc_inAngleSector} else {FALSE})) then {
		{
			switch (getNumber (configFile >> "CfgWeapons" >> (currentWeapon _x) >>  "type")) do {
				case 1: {_bla = (_x playMove "amovpercmstpslowwrfldnon")};	//rifles
				//case 2: {_x playMove "amovpercmstpslowwpstdnon"};			//sidearms; DISABLED (news:hg53c9$uuo$1@new-server.localdomain)
				//case 4: {_x playMove "amovpercmstpslowwlnrdnon"}			//launchers; DISABLED (news:hg53c9$uuo$1@new-server.localdomain)
			}
		} forEach [_target, _receiver]
	};
	if (!(isNil "_bla") and ((random 20) < 1)) then {activateKey "BIS_ScenesPlayed"}; // ask Maruk about this code, added on purpose here to fix a bug in the system
};

//only execute kbTell where _target is local
if (!(local _target)) exitWith {};

//CAMPAIGN ONLY!!! :: Teamswitch to Cooper if he's about to talk
if (!(isNil "BIS_cooper") && !(isNil "BIS_sykes") && !(isNil "BIS_rodriguez") && !(isNil "BIS_ohara")) then {
	if (_receiver == BIS_cooper) then {
		_isTSEnabled = FALSE;
		if (teamSwitchEnabled) then {_isTSEnabled = TRUE};
		if (!(isPlayer BIS_cooper)) then {
			selectPlayer BIS_cooper;
			_nic = [BIS_cooper, BIS_cooper, "loc", rTITLETEXT, "", "BLACK IN", 1] spawn RE;
		};
		enableTeamSwitch FALSE;
		[_target, _receiver, _topic, _sentence, _isTSEnabled] spawn {
			_tWasSaid = time;
			waitUntil {((_this select 0) kbWasSaid [(_this select 1), (_this select 2), (_this select 3), 999999] || time > _tWasSaid + 10) && commandingMenu != "#CONVERSATION"};
			if (_this select 4) then {enableTeamSwitch TRUE}
		}
	}
};

//automatic look-at
if (_target distance _receiver < 30 && behaviour _target != "COMBAT" && behaviour _receiver != "COMBAT" && _lower) then {_target doWatch _receiver; _target lookAt _receiver; _target glanceAt _receiver; _receiver doWatch _target; _receiver lookAt _target; _receiver glanceAt _target};

if (_target kbHasTopic _topic && lifeState _target != "UNCONSCIOUS") then {
	_target kbTell [_receiver, _topic, _sentence];
	if (_lower) then {call _checkLowering}
} else {
	//can lead to saying of sentences in wrong order
	[_target, _receiver, _topic, _sentence, _lower, _checkLowering] spawn {
		_target = _this select 0;
		_receiver = _this select 1;
		_topic = _this select 2;
		_sentence = _this select 3;	
		waitUntil {_target kbHasTopic _topic && lifeState _target != "UNCONSCIOUS"};
		_target kbtell [_receiver, _topic, _sentence];
		if (_lower) then {call _checkLowering}
	}
};