private ["_unitRank","_groupID","_geardata","_group","_squad","_unitsquad","_side","_spawnpos","_fakepos","_offset","_fakespawnpos","_respawntime","_issuqadleader"];

_unit = _this select 0;

3 FadeSound 0;
3 FadeRadio 0;

cutText ["","BLACK OUT",1];

_unitRank = rank _unit;
_groupID= _unit getVariable "DAP_GROUPDATA";

_issuqadleader= _unit getVariable "DAP_BF_SQUADLEADER";
_unitsquad = _unit getVariable "DAP_BF_SP_SQUAD";

_rallypointdata  = _unit getVariable "DAP_WEST_RALLYPOINT";
_geardata = _unit getVariable "DAP_BF_PLAYERLOADOUT";

if (isNil("_issuqadleader")) then {_issuqadleader=0;};

_startpos = _unit getVariable "DAP_BF_PLAYER_RESPAWNPOS";
_dir = _unit getVariable "DAP_BF_PLAYER_RESPAWNDIR";

_unitDir = getDir vehicle _unit;

enableTeamSwitch false; 

_type = typeOf _unit;
_side = getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side");

_fakepos = vehicle _unit modelToWorld [0,-3,0];
_offset = [0,-3,0];
_fakespawnpos = vehicle _unit modelToWorld [0,-100000,10000];

if (_unit != (vehicle _unit)) then 
{
	_fakepos = vehicle _unit modelToWorld [0,-15,1];
	_offset = [0,-15,1];
	_fakespawnpos = vehicle _unit modelToWorld [0,-100000,10000];
};

_fakeunit = createAgent ["Rabbit_f", _fakespawnpos, [], 0, "FORM"];
hideObject  _fakeunit;

_fakeunit addEventHandler ["HandleDamage",{0}];
_fakeunit enableSimulation false;

_fakeunit setPos _fakepos;
_fakeunit setDir _unitDir;

if ((vehicle _unit) == _unit) then 
{
	_fakeunit attachTo [_unit,_offset,"neck"];
}
else
{
	if ((vehicle _unit)isKindOf "LandVehicle") then 
	{
		_fakeunit attachTo [(vehicle _unit),_offset];
	};
};

addSwitchableUnit _fakeunit;
selectPlayer _fakeunit;
removeSwitchableUnit _fakeunit;

[_unit] execVM "Scripts\ClearBattlefield.sqf";

_respawntime = 15;
sleep _respawntime;

_sides = [east, west, resistance, civilian, nil, enemy, friendly, nil];
_group = createGroup (_sides select _side);

_newunit = _group createUnit [_type, _startpos, [], 0, "FORM"];
_newunit setDir _dir;

_group setGroupID [(localize _groupID)];
_newunit setVariable ["DAP_GROUPDATA",_groupID,true];

_newunit setVariable ["DAP_BF_PLAYER_RESPAWNPOS",_startpos,true];
_newunit setVariable ["DAP_BF_PLAYER_RESPAWNDIR",_dir,true];

addSwitchableUnit _newunit;
selectPlayer _newunit;

_newunit setUnitRank _unitRank;

[_newunit, _startpos, _dir] execVM "Scripts\SP\PlayerSlot.sqf";

if (_issuqadleader==1) then {_unit setVariable ["DAP_BF_SQUADLEADER",1,true];};

deleteVehicle _fakeunit;

if (!(isNil("_rallypointdata"))) then 
{
	_newunit setVariable ["DAP_WEST_RALLYPOINT",_rallypointdata];
};

if (!(isNil("_unitsquad"))) then 
{
	_newunit setVariable ["DAP_BF_SP_SQUAD", _unitsquad, true];
};

if (!(isNil("_geardata"))) then 
{
	_newunit setVariable ["DAP_BF_PLAYERLOADOUT",_geardata];
};

if ((count DAP_BF_PLAYERSQUAD)>0) then 
{
	{
		if (alive _x) then
		{
			[_x] JoinSilent group player;
		};
		
	}ForEach DAP_BF_PLAYERSQUAD;
};

[_newunit] execVM "Scripts\UI\OptionsManager.sqf";
[_newunit] execVM "Scripts\SP\WEST\Soldier.sqf";

[[_newunit]] execVM "DAPMAN\Init.sqf";

enableTeamSwitch true;

titleCut ["","BLACK IN"];

0 FadeSound CurrentSoundVolume;
0 FadeRadio CurrentRadioVolume;
