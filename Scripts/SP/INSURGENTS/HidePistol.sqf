private ["_type","_gun"];

_man = _this select 0;
_id = _this select 2;
_man removeaction _id;

{
	_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
	if (_type==2) then 
	{
		_gun = _x;
	};
}ForEach weapons _man;

_state = _man getVariable "DAP_INS_HOLSTER_PISTOL";

if (isNil("_state")) then 
{

	_man setVariable ["DAP_INS_HOLSTER_PISTOL",_gun,true];
	_man removeWeapon _gun;

	if ((count (weapons _man)) >0) then 
	{
		_man selectWeapon ((weapons _man) select 0);
	}
	else
	{
		_man selectWeapon "throw";
	};

	Unhidepistol = _man addaction [localize "STR_ACT_UNHIDE_PISTOL","Scripts\SP\Insurgents\UnhidePistol.sqf",[],0,false,true];

	dap_pistolstate=0;

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
	HintSilent localize "STR_ACT_ANOTHERHIDDENPISTOL";
	dap_pistolstate=0;
};