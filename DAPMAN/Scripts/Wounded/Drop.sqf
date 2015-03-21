_unit = _this select 0;
_dragger = _this select 1;

_type = (_dragger getVariable "DAP_BC_dragger_stand");
if (_type) then 
{
	[nil,_dragger, rPLAYMOVENOW, "AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] call RE;
}
else
{
	_dragger setVariable ["DAP_BC_dragger_stand",true,true];
};