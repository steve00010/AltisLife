/*
	File: fn_welcomeNotification.sqf
	by BB-MaTriX
	Description:
	Called upon first spawn selection and welcomes our player.
*/

private["_display","_rules"];
createDialog "life_server_rules";
disableSerialization;
_display = findDisplay 2300;
noesckey = (findDisplay 2300) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 
_rules = _display displayCtrl 2302;
_news = _display displayCtrl 2303;



_rules ctrlSetStructuredText parseText format["<img size='2.5' image='images\logo.jpg'/><br/><br/><t size='1.1'>Welcome %1</t><br/><br/><t size='0.8px'>If you want to play on this server you need to accept the server rules.</t><br/><br/><t size='0.8px'>Our Admin staff are on hand at most times via our TS server if you need help.</t><br/><br/><br/><br/>br/><br/><t size='1.2'>Patchnotes:</t>",name player];




_news ctrlSetStructuredText parseText format["
<br/><t size='1.1' color='#0099FF'>  Patchnotes%1</t><br/><br/>
<t size='0.8px'>- Updated some vendors</t><br/>
<t size='0.8px'>- Updated Database</t><br/>
<t size='0.8px'>- Updated Starting Cash</t><br/>
<t size='0.8px'>- New Hatchback Skin</t><br/>
<t size='0.8px'>- New Welcome Screen</t><br/>
<t size='0.8px'></t><br/>
<t size='0.8px'></t><br/>
<t size='0.8px'></t><br/>
<t size='0.8px'></t><br/>
<t size='0.8px'>Please report any bugs on our forums.</t><br/>
<br/><br/><t size='0.7px'>   Have fun playing!</t>
",":"];