scriptName "MP\data\scriptCommands\setDate.sqf";


if (count _this < 3) exitWith {};

if ((typeName (_this select 2)) == "ARRAY") then
{ //nic = [nil, nil, "per", rSETDATE,[2018,1,1,0,0]] call RE;
  private ["_array"];
  _array = (_this select 2);  
  setDate [_array select 0, _array select 1, _array select 2, _array select 3, _array select 4];
}
else
{// nic = [nil, nil, rSETDATE,2018,1,1,0,0] call RE;
  if (count _this < 6) exitWith {};
  setDate [_this select 2, _this select 3, _this select 4, _this select 5, _this select 6];
};






