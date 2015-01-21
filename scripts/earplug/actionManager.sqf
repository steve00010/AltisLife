_unit0 = _this select 0;
_unit1 = _this select 1;
_act = _this select 2;
_unit0 removeAction _act;
if (wakPlugs) then {
    wakPlugs = false;
    0.5 fadeSound 1;
    _unit1 addAction wakOnAction;
} else {
    wakPlugs = true;
    0.5 fadeSound 0.1;
    _unit1 addAction ["<t color='#ffff33'>Ear Plugs Out</t>", "scripts\earplug\actionManager.sqf", [], -90, false, true, "", "_target == vehicle player"];
};