_unit = _this select 1;

if (local _unit) then 
{
	_fulldata = _unit getVariable "DAP_BF_PLAYERLOADOUT";

	if (!(isNil("_fulldata"))) then 
	{
		_data = (_fulldata select 0);
		_bnc = (_fulldata select 1);
		
		_s = false;

		removeVest _unit;
		_unit addVest "V_PlateCarrier1_rgr";
	 
		removeAllAssignedItems _unit;
		{ 
			_unit addItem _x;
			_unit assignItem _x;
		} foreach (_data select 0);

		_unit removeWeapon (primaryWeapon _unit);
		_w = _data select 1;             
	
		if(_w != "") then 
		{                                                                     
  			_unit addMagazine (getArray(configFile>>"CfgWeapons">>_w>>"magazines") select 0);                  
  			_unit addWeapon _w;                                                                                    
  		
  			{if(_x!="") then {_unit removePrimaryWeaponItem _x;};} forEach (primaryWeaponItems _unit);                                 
  			{if(_x!="") then {_unit addPrimaryWeaponItem _x;};} foreach (_data select 2);                             
                                                                                                           
  			_mz = getArray(configFile>>"CfgWeapons">>_w>>"muzzles");                                                 
  			if (_mz select 0 != "this") then 
  			{                                                                        
    				_w = _mz select 0;                                                                                      
  			};                                                                                                        
  			_unit selectWeapon _w;                                                                                       
  			_s = true;                                                                                                   
		};

		_unit removeWeapon (handgunWeapon _unit);
		_w =_data select 3;
	
		if(_w != "") then 
		{
			_unit addMagazine (getArray(configFile>>"CfgWeapons">>_w>>"magazines") select 0);
			_unit addWeapon _w;
			if(!_s) then 
			{
				_unit selectWeapon _w;
    				_s = true;  
  			};
		};

		_unit removeWeapon (secondaryWeapon _unit);
		_w = _data select 5;
	
		if(_w != "") then 
		{
			_unit addMagazine (getArray(configFile>>"CfgWeapons">>_w>>"magazines") select 0);
			_unit addWeapon _w;
 			{if(_x!="") then {_unit addSecondaryWeaponItem _x;};} foreach (_data select 6);
  			if(!_s) then 
  			{
    				_unit selectWeapon _w;
    				_s = true;  
  			};
		};


		_add = {
  				private ["_i"];
				_i = _this select 0;
				if(isClass(configFile>>"CfgMagazines">>_i)) then 
				{
    					_unit addMagazine _i;
  				}
  				else
  				{
    					if((isClass(configFile>>"CfgWeapons">>_i))and((tolower(_i)) != (tolower("NVGoggles")))and((tolower(_i)) != (tolower("FirstAidKit")))and((tolower(_i)) != (tolower("Medikit")))) then 
    					{
						_unit addWeapon _i;
    					}
    					else
    					{
      					_unit addItem _i;
    					};
  				};
			};

		removeUniform _unit;
		_p = 0;
		
		if(_data select 7 != "") then 
		{
			_unit addUniform (_data select 7);
			{[_x] call _add;} foreach (_data select 8);
  
  			while {loadUniform _unit < 1} do 
			{
				_unit addItem "ItemWatch";
				_p = _p + 1;
			};
 
		}; 

		removeVest _unit;
		if(_data select 9 != "") then
		{
			_unit addVest (_data select 9);
			_c = vest _unit;
			{[_x] call _add; } foreach (_data select 10);
		};

		_add = {
				private ["_i","_c"];
			
				_i = _this select 0;
				_c = _this select 1;
  			
  				if(isClass(configFile>>"CfgMagazines">>_i)) then 
  				{
    					_c addMagazineCargoGlobal [_i,1];
  				}
  				else
  				{
    					if((isClass(configFile>>"CfgWeapons">>_i))and((tolower(_i)) != (tolower("NVGoggles")))and((tolower(_i)) != (tolower("FirstAidKit")))and((tolower(_i)) != (tolower("Medikit")))) then
    					{
						_c addWeaponCargoGlobal [_i,1];
    					}
    					else
    					{
      					_c addItemCargoGlobal [_i,1];
    					};
  				};
			};

		removeBackpack _unit;
		if(_data select 11!="") then
		{
  			_unit addBackpack (_data select 11);                                                                    
  			_c = unitBackpack _unit; 
  			clearWeaponCargo _c;
  			clearMagazineCargo _c;
 			clearItemCargo _c;
  			clearBackpackCargo _c;   
  			{[_x,_c] call _add; } foreach (_data select 12);
		};


		for "_i" from 1 to _p do 
		{
  			_unit removeItem "ItemWatch"; 
		};

		removeHeadgear _unit;
		if(_data select 13!="") then 
		{
  			_unit addHeadgear (_data select 13);
		};

		removeGoggles _unit;
		if(_data select 14!="") then 
		{
			_unit addGoggles (_data select 14);
		};
		
		if (_bnc=="Binocular") then {_unit addWeapon "Binocular";};
	}
	else
	{
		HintSilent localize "STR_ARMORY_NOSAVEDLOADOUT";
		
		sleep 5;
		
		HintSilent "";	
	};
	
	[_unit] execVM "Scripts\Support\LoadLoadout.sqf";
};