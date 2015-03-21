private ["_haspistol"];

_man = _this select 0;
_id = _this select 2;

_haspistol=0;
{
	_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
	
	if (_type==2) then 
	{
		_haspistol = 1;
	};
	
}ForEach weapons _man;

if (_haspistol==0) then 
{
	_man removeaction _id;
	_man setCaptive false;
	_gun = _man getVariable "DAP_INS_HOLSTER_PISTOL";
	_man addWeapon _gun;
	_man selectWeapon _gun;
	_man setVariable ["DAP_INS_HOLSTER_PISTOL",nil,true];
}
else
{
	hintSilent localize "STR_ACT_ANOTHERPISTOL";
};

