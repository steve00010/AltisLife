_heap = _this select 0;
_side = _this select 1;

if (_side==0) then 
{
	_heap addAction [localize "STR_TAKE_FIELD", "Scripts\Support\BP.sqf", ["B_AssaultPack_khk"],3,false,true];
	_heap addAction [localize "STR_TAKE_BERGEN", "Scripts\Support\BP.sqf", ["B_Bergen_sgg"],3,false,true];
	_heap addAction [localize "STR_TAKE_CARRYALL", "Scripts\Support\BP.sqf", ["B_Kitbag_sgg"],3,false,true];

	_heap addAction [localize "STR_REMOVE_BACKPACK", "Scripts\Support\BP.sqf", [""],3,false,true];
};

if (_side==1) then 
{
	_heap addAction [localize "STR_TAKE_FIELD", "Scripts\Support\BP.sqf", ["B_AssaultPack_khk"],3,false,true];
	_heap addAction [localize "STR_TAKE_BERGEN", "Scripts\Support\BP.sqf", ["B_Bergen_sgg"],3,false,true];
	_heap addAction [localize "STR_TAKE_CARRYALL", "Scripts\Support\BP.sqf", ["B_Kitbag_sgg"],3,false,true];
		
	_heap addAction [localize "STR_REMOVE_BACKPACK", "Scripts\Support\BP.sqf", [""],3,false,true];
};