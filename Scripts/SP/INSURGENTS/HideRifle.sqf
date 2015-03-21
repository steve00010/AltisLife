_man = _this select 0;
_id = _this select 2;
_man removeaction _id;
_gun = primaryWeapon _man;

_state = _man getVariable "DAP_INS_HOLSTER_RIFLE";

if (isNil("_state")) then 
{

	_man setVariable ["DAP_INS_HOLSTER_RIFLE",_gun,true];
	_man removeWeapon _gun;

	if ((count (weapons _man)) >0) then 
	{
		_man selectWeapon ((weapons _man) select 0);
	}
	else
	{
		_man selectWeapon "throw";
	};

	Unhiderifle =_man addaction [localize "STR_ACT_UNHIDE_RIFLE","Scripts\SP\Insurgents\UnhideRifle.sqf",[],0,false,true];

	dap_riflestate=0;

	if((count (items _man))==(count(weapons _man))) then 
	{
		sleep 30;
		if((count (items _man))==(count(weapons _man))) then 
		{
			_man setCaptive true;
		};
	};
}
else
{
	HintSilent localize "STR_ACT_ANOTHERHIDDENRIFLE";
	dap_riflestate=0;
};
