[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};
[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 4);
		life_maxWeight = life_maxWeightT + _load;
		if(playerSide == west) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};
[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};
[] spawn
{
	waitUntil { life_session_completed };
	while{true} do {
		for "_i" from 0 to (count life_addiction)-1 do
		{
			_new = life_addiction select _i;
			if (_new > 0) then
			{
				_new = _new - 0.04;
				if (_new < 0) then { _new = 0; };
				life_addiction set [_i, _new];
				if (_new > 0 && (time - (life_used_drug select _i)) > 600) then
				{
					switch (true) do
					{
						case (_new > 0.4 && _new <= 0.6): { 
							systemChat "Damn man you need to get high, you're starting to get the shakes."; 
							resetCamShake;							
							
							[_i] spawn { 
								private["_dt"];
								_dt = _this select 0;
								for "_j" from 0 to 55 do
								{
									addCamShake [random 2, 4, 1];
									if((time - (life_used_drug select _dt)) < 600) exitWith {
										systemChat "Ooh much better!"; 
									};
									"DynamicBlur" ppEffectEnable true;    
									"DynamicBlur" ppEffectAdjust [random 2];   
									"DynamicBlur" ppEffectCommit 1;
									sleep 4;
								};
								"DynamicBlur" ppEffectEnable false;
								resetCamShake;
							};
							life_drug_withdrawl = false; 
						};
						case (_new > 0.6 && _new <= 0.9): { 
							systemChat "Aghh, you're reaaaallly needing a fix!"; 
							resetCamShake;
							
							[_i] spawn { 
								private["_dt"];
								_dt = _this select 0;
								for "_j" from 0 to 55 do
								{
									addCamShake [random 3, 4, 3];
									if((time -  (life_used_drug select _dt)) < 600) exitWith {
										systemChat "You feel all warm inside!"; 
									};
									"DynamicBlur" ppEffectEnable true;    
									"DynamicBlur" ppEffectAdjust [random 3];   
									"DynamicBlur" ppEffectCommit 1;
									sleep 4;
								};
								"DynamicBlur" ppEffectEnable false;
								resetCamShake;
							};
							life_drug_withdrawl = false; 
						};
						case (_new > 0.9):
						{
							systemChat "This is getting out of control, get your stuff quickly man!";
							if (!life_drug_withdrawl) then { 
								[_i] spawn { 
									private["_dt"];
									_dt = _this select 0;
									while {life_drug_withdrawl} do { 
										if((time -  (life_used_drug select _dt)) < 600) exitWith {systemChat "Uggghhh that's the stuff!!"; };
										resetCamShake; 
										addCamShake [3, 8, 3];
										"DynamicBlur" ppEffectEnable true;    
										"DynamicBlur" ppEffectAdjust [random 4];   
										"DynamicBlur" ppEffectCommit 1;
										sleep 3;
									}; 
								resetCamShake;
								"DynamicBlur" ppEffectEnable false;

								};
							};
							life_drug_withdrawl = true;
						};
					};
				};
			};
		};
		sleep 240;
		life_drug_level = life_drug_level - 0.5;
		if (life_drug_level < 0) then { life_drug_level = 0; };
	};
};
[] spawn
{
	while {true} do
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {
		
			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};
		
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;
		
	};
};