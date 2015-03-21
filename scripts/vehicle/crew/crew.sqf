disableSerialization;

Private ["_name","_vehicle","_weapname","_weap","_target","_picture","_vehtarget","_azimuth","_wepdir","_hudnames","_ui"];

while { true } do {

	1000 cutRsc ["HudNames","PLAIN"];
	_ui = uiNameSpace getVariable "HudNames";
	_HudNames = _ui displayCtrl 99999;

	if(player != vehicle player) then {
		_name = "";
		_vehicle = assignedVehicle player;

			{
				if((driver _vehicle == _x) || (gunner _vehicle == _x) || (commander _vehicle == _x)) then {
			
				if(driver _vehicle == _x) then {
					_name = format ["<t size='0.85' color='#f0e68c'>%1 %2</t> <img size='0.7' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><br/>", _name, (name _x)];
				};
				if(gunner _vehicle == _x) then {
					_name = format ["<t size='0.85' color='#f0e68c'>%1 %2</t> <img size='0.75' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'/><br/>", _name, (name _x)];
				};
				if(commander _vehicle == _x) then {
					_name = format ["<t size='0.85' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa'/><br/>", _name, (name _x)];
				};
				}
				else
				{
					_name = format ["<t size='0.85' color='#f0e68c'>%1 %2</t> <img size='0.7' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa'/><br/>", _name, (name _x)];
				};
			} forEach crew _vehicle;

      	_HudNames ctrlSetStructuredText parseText _name;
      	_HudNames ctrlCommit 0;
    	};

    sleep 5;
};