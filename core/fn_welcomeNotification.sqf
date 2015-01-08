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



_rules ctrlSetStructuredText parseText format["<img size='2.5' image='images\logo.jpg'/><br/><br/><t size='1.1'>Welcome %1</t><br/><br/><t size='0.8px'>If you want to play on this server you need to accept the server rules.</t><br/><br/><t size='0.8px'>Our Admin staff are on hand at most times via our TS server if you need help.</t><br/><br/><br/><br/><br/><br/><t size='1.2'>Useful Info:</t>",name player];




_news ctrlSetStructuredText parseText format["
<br/><t size='1.1' color='#0099FF'>  Useful Info%1</t><br/><br/>
<t size='0.8px'>- Buy a phone and gps, do not carry all your money on you, you lose it if you die.</t><br/>
<t size='0.8px'>- We have a dynamic market here, so check it regularly, illegal is not always the best choice.</t><br/>
<t size='0.8px'>- Guides and updates can be found on our forum, prophecygaming.co.uk.</t><br/>
<t size='0.8px'>- Enter your player id (not name) on our members section to get info about your character.</t><br/>
<t size='0.8px'>- Press Y to access your player interaction menu.</t><br/>
<t size='0.8px'>- We have a top 10 bounty list on our webpage.</t><br/>
<t size='0.8px'>- Gangs are permanent, that's why they cost so much.</t><br/>
<t size='0.8px'>- We have drug addiction and you can be breathalysed.</t><br/>
<t size='0.8px'>- Join our community, we are always looking for new players.</t><br/>
<t size='0.8px'>- Please report any bugs on our forums.</t><br/>
<br/><br/><t size='0.7px'>   Have fun playing!</t>
",":"];