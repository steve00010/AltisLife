private ["_squadinfo","_roletype","_role","_unitname"];

_caller = _this select 1;
_squad = (units(group _caller));

_squadinfo = "";

_role = "<img image='pictures\icons\icon_leader.paa' size='1.25' color='#00ff00' align='left'/>";

_squadname = (_caller getVariable "DAP_GROUPDATA");
if (!(isnil("_squadname"))) then 
{
	_squadinfo = _squadinfo +"<br/><br/>"+(localize _squadname);
};

_NameArray = toArray (name (leader (group _caller)));
if ((count _NameArray)>15) then 
{
	_unitname = "";
			
	For "_i" from 0 to 15 do 
	{
		_unitname = _unitname + (toString [_NameArray select _i]);
	};
			 
}
else
{
	_unitname = "";

	For "_i" from 0 to (count _NameArray) do 
	{
		_unitname = _unitname + (toString [_NameArray select _i]);
	};
};

_squadinfo = _squadinfo +"<br/><br/>"+(localize "STR_DAP_BF_SQUAD_LEADER")+"<br/><br/>"+_role+"<t align='left'>"+"  "+(_unitname)+"</t>"+"<br/><br/>";
_squad = _squad - [(leader group _caller)];

if ((count (units(group _caller)))>1) then
{
	_squadinfo = _squadinfo +(localize "STR_DAP_BF_SQUAD_MEMBERS")+"<br/>";
	{
	if (isMultiplayer) then 
	{
		if (isPlayer _x) then 
		{
			_roletype = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "attendant");
			
			if (_roletype == 1) then 
			{
				_role = "<img image='pictures\icons\icon_medic.paa' size='1.25' color='#00ff00' align='left'/>";
			}
			else
			{
				_roletype = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "candeactivatemines");
				if (_roletype==1) then 
				{
					_role = "<img image='pictures\icons\icon_sapper.paa' size='1.25' color='#00ff00' align='left'/>";
				}
				else
				{
					_roletype = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "namesound");
					if ((_roletype=="veh_infantry_MG_s")or((getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "icon"))== "\Ca\characters2\data\icon\i_machinegunner_CA.paa")) then 
					{
						_role = "<img image='pictures\icons\icon_mg.paa' size='1.25' color='#00ff00' align='left'/>";
					}
					else
					{
						if (_roletype=="veh_Sniper") then 
						{
							_role = "<img image='pictures\icons\icon_soldier.paa' size='1.25' color='#00ff00' align='left'/>";
						}
						else
						{
							_role = "<img image='pictures\icons\icon_soldier.paa' size='1.25' color='#00ff00' align='left'/>";
						};
					};
				};
			};
			
			_NameArray = toArray (name _x);
			if ((count _NameArray)>15) then 
			{
				_unitname = "";
				For "_i" from 0 to 15 do 
				{
					_unitname = _unitname + (toString [_NameArray select _i]);
				};
				 
			}
			else
			{
				_unitname = "";
				For "_i" from 0 to (count _NameArray) do 
				{
					_unitname = _unitname + (toString [_NameArray select _i]);
				};
			};
			
			_squadinfo = _squadinfo +"<br/>"+_role+"<t align='left'>"+"  "+(_unitname)+"</t>";
		};
	}
	else
	{
		_roletype = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "attendant");
		
		if (_roletype == 1) then 
		{
			_role = "<img image='pictures\icons\icon_medic.paa' size='1.25' color='#00ff00' align='left'/>";
		}
		else
		{
			_roletype = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "candeactivatemines");
			if (_roletype==1) then 
			{
				_role = "<img image='pictures\icons\icon_sapper.paa' size='1.25' color='#00ff00' align='left'/>";
			}
			else
			{
				_roletype = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "namesound");

				if ((_roletype=="veh_infantry_MG_s")or((getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "icon"))== "\Ca\characters2\data\icon\i_machinegunner_CA.paa")) then 
				{
					_role = "<img image='pictures\icons\icon_mg.paa' size='1.25' color='#00ff00' align='left'/>";
				}
				else
				{
					if (_roletype=="veh_Sniper") then 
					{
						_role = "<img image='pictures\icons\icon_soldier.paa' size='1.25' color='#00ff00' align='left'/>";
					}
					else
					{
						_role = "<img image='pictures\icons\icon_soldier.paa' size='1.25' color='#00ff00' align='left'/>";
					};
				};
			};
		};
		
		_NameArray = toArray (name _x);
		if ((count _NameArray)>15) then 
		{
			_unitname = "";
			
			For "_i" from 0 to 15 do 
			{
				_unitname = _unitname + (toString [_NameArray select _i]);
			};
			 
		}
		else
		{
			_unitname = "";
			
			For "_i" from 0 to (count _NameArray) do 
			{
				_unitname = _unitname + (toString [_NameArray select _i]);
			};
		};
		
		_squadinfo = _squadinfo +"<br/>"+_role+"<t align='left'>"+"  "+(_unitname)+"</t>";
	};
	
	}ForEach _squad;
};

HintSilent ParseText ("<br/>"+(localize "STR_DAP_BF_SQUAD_STATUS")+_squadinfo+"<br/> ");

sleep 5;

HintSilent "";