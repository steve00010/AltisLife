

/*

    Vehicle after spawn

*/

private["_veh","_classname"];

_veh = _this select 0;
_classname = typeOf _veh;

switch (_classname) do
{
    case "I_Plane_Fighter_03_AA_F":
    {
        //Remove ammo
         _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
    
    case "B_Plane_CAS_01_F":
    {
        //Remove ammo
         _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
    
    case "O_Plane_CAS_02_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
    
    case "B_Heli_Transport_01_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };

    case "B_UAV_02_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	case "B_APC_Wheeled_01_cannon_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	case "O_Heli_Light_02_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	case "B_Heli_Transport_01_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	
	case "B_Heli_Attack_01_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	case "B_Heli_Attack_01_F":
    {
        //Remove ammo
        _veh setVehicleAmmo 0;
        
         systemChat "Weapons removed.";
    };
	
	
};