_man = _this select 0;
_id = _this select 2;

if (primaryWeapon _man == "") then 
{
	_man removeaction _id;
	_man setCaptive false;
	_gun = _man getVariable "DAP_INS_HOLSTER_RIFLE";
	_man addWeapon _gun;
	_man selectWeapon _gun;
	_man setVariable ["DAP_INS_HOLSTER_RIFLE",nil,true];
}
else
{
	hintSilent localize "STR_ACT_ANOTHERRIFLE";
};
