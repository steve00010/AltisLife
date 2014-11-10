/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1500}; //Drivers License cost
	case "boat": {1500}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {15000}; //Firearm/gun license cost
	case "dive": {1500}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {10000000}; //Swat License cost
	case "cg": {1500}; //Coast guard license cost
	case "heroin": {35000}; //Heroin processing license cost
	case "marijuana": {25500}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {20000}; //Gang license cost
	case "rebel": {100000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {12000};
	case "cocaine": {30000};
	case "sand": {14500};
	case "iron": {9500};
	case "copper": {8000};
	case "cement": {6500};
	case "mair": {15000};
	case "home": {150000};
	case "stiller":{50000};
	case "liquor":{100000};
	case "bottler":{100000};
	case "mash":{100000};
};