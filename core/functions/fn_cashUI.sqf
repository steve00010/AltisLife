#include <macro.h>
#define IDD_LIFE_MAIN_DISP 2203
#define IDC_life_cash_TEXT 1003


#define LIFEdisplay (GVAR_UINS ["playerHUD",displayNull]) 
#define LIFEctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)

disableSerialization;
if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
[] spawn
{
	private["_ca"];
	while {true} do
	{
		_ca = CASH;
		waitUntil {(CASH) != _ca};
		LIFEctrl(IDC_life_cash_TEXT) ctrlsetText format["$%1", [CASH] call life_fnc_numberText];
	};
};