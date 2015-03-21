_object = _this select 0;

if ((isServer) or (isDedicated)) then 
{
	"HelicopterExploBig" createVehicle getPos _object;
};

