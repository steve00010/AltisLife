class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 3500, "" }, 
			{ "C_Hatchback_01_F", 6500, "driver" }, 
			{ "C_Offroad_01_F", 8500, "driver" },
			{ "C_SUV_01_F", 15000, "driver" },
			{ "C_Hatchback_01_sport_F", 60000, "driver", },
			{ "C_Van_01_transport_F", 45000, "driver" }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "pilot" },
			{ "C_Heli_Light_01_civil_F", 253000, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", 700000, "pilot", }
		};
	};

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 5000, "boat" },
			{ "C_Boat_Civil_01_F", 22000, "boat" },
			{ "B_SDV_01_F", 150000, "boat" }
		};
	};	

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", 45000, "trucking" },
			{ "I_Truck_02_transport_F", 150000, "trucking" },
			{ "I_Truck_02_covered_F", 170000, "trucking" },
			{ "O_Truck_03_ammo_F", 600000, "trucking" },
			{ "O_Truck_03_transport_F", 700000, "trucking", },
			{ "O_Truck_03_covered_F", 800000, "trucking", },
			{ "B_Truck_01_transport_F", 900000, "trucking", },
			{ "O_Truck_03_device_F", 1200000, "trucking", },
			{ "B_Truck_01_covered_F", 1000000, "trucking", }			

		};
	};	
	
	class arc_car {
		side = "arc";
		vehicles[] = { 
			{ "B_G_Offroad_01_F", 7500, "" },
			{ "B_Truck_01_mover_F", 200000, "" },
			{ "I_Truck_02_covered_F", 150000, "" },
			{ "C_SUV_01_F", 10000, "" },
			{ "O_Truck_03_device_F", 2000000, "", },			
			{ "C_Hatchback_01_sport_F", 60000, "", }		
		};
	};
	
	class arc_air {
		side = "arc";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "" },
			{ "B_Heli_Transport_03_unarmed_F", 1300000, "" },
			{ "O_Heli_Light_02_unarmed_F", 700000, "", }			
		};
	};

	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 3000 , "driver" },
			{ "C_Kart_01_Fuel_F", 3000, "driver" },
			{ "C_Kart_01_Red_F", 3000, "driver" },
			{ "C_Kart_01_Vrana_F", 3000, "driver" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_F", 5000, "" },
			{ "C_SUV_01_F", 10000, "" },
			{ "C_Van_01_box_F", 20000, "" }

		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "O_Heli_Light_02_unarmed_F", 50000, "mAir",{ "life_mediclevel", 1 } }
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" },
			{ "B_G_Offroad_01_F", 7500, "" },
			{ "B_G_Offroad_01_armed_F", 600000, "rebel" }
		};
	};
	class reb_boat {
		side = "civ";
		vehicles[] = {
			{ "I_SDV_01_F", 25000, "" },
			{ "O_G_Boat_Transport_01_F", 17500, "" }
		};
	};
	
	class reb_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "" },
			{ "B_Heli_Light_01_armed_F", 253000, "" },
			{ "O_Heli_Transport_04_bench_F", 2750000, "" },
			{ "O_Heli_Light_02_unarmed_F", 700000, "", },
			{ "B_Heli_Transport_01_camo_F", 1800000, "", }
		};
	};	
	
	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", 5000, ""},
			{ "C_SUV_01_F", 10000, "" },
			{ "C_Hatchback_01_F", 6500, "" }, 
			{ "C_Hatchback_01_sport_F", 60000, "", },
			{ "B_MRAP_01_F", 175000, "", { "life_coplevel", 4 } }
		};
	};
	
	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, "cAir",{ "life_coplevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 700000, "cAir", },
			{ "B_Heli_Transport_01_F", 1800000, "cAir", },
			{ "I_Heli_light_03_F", 1000000, "cAir", }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, "cAir",{ "life_coplevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 700000, "cAir", },
			{ "B_Heli_Transport_01_F", 1800000, "cAir", },
			{ "I_Heli_light_03_F", 1000000, "cAir", }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", 3000, "coastguard" },
			{ "C_Boat_Civil_01_police_F", 20000, "coastguard" },
			{ "B_SDV_01_F", 25000, "coastguard" }
		};
	};	
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class CfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};
	
		class B_Truck_01_medical_F : Default {						//HEMTT Medical
		vItemSpace = 80;
		storageFee[] = { 6500, 6500, 6500, 65000 };
		garageSell[] = { 25000, 25000, 25000, 25000 };
		chopShop = 12500;
	};
	
	class B_MRAP_01_hmg_F : Default {								//Hunter HMG
		vItemSpace = 100;
	};

	class B_Boat_Transport_01_F {									//Assault Boat
        vItemSpace = 45;
        storageFee[] = { 450, 450, 450, 450 };
		garageSell[] = { 850, 850, 850, 850 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class B_Truck_01_mover_F {										//HEMTT Mover
        vItemSpace = 30;
        storageFee[] = { 2500, 2500, 2500, 2500 };
		garageSell[] = { 235000, 235000, 235000, 200000 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = {
		{ "ARC Mover", "arc", {
				"textures\vehicles\arc\archemt1.paa"
			} }	
		};	
    };
	
	class B_Truck_01_Repair_F {										//HEMTT Repair
        vItemSpace = 50;
        storageFee[] = { 2500, 2500, 2500, 2500 };
		garageSell[] = { 235000, 235000, 235000, 235000 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = {			
		{ "ARC Repair", "arc", {
				"textures\vehicles\arc\archemt1.paa"
			} }
		};	
	};

	class B_Truck_01_transport_F {									//HEMTT Transport
        vItemSpace = 350;
        storageFee[] = { 2500, 2500, 2500, 2500 };
		garageSell[] = { 235000, 235000, 235000, 235000 };
        insurance = 2500;
        chopShop = 235000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {									//Assault Boat						
        vItemSpace = 45;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Offroad_01_F {										//Off-Road
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 3500, 3500, 3500, 3500 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { 			
			{ "ARC", "arc", {
				"textures\vehicles\arc\arc_offroad.paa"
			} }	
        };
    };

	class B_Truck_01_box_F {										//HEMTT Box
        vItemSpace = 450;
        storageFee[] = { 35000, 35000, 35000, 35000 };
		garageSell[] = { 150000, 15000, 15000, 150000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = { };
    };

	class B_Quadbike_01_F {											//Quadbike
        vItemSpace = 25;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 950, 950, 950, 950 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
			{ "Digi Desert", "reb", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
	        } },
			{ "Black", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
	        } },
			{ "Blue", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
	        } },
			{ "Red", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
	        } },
			{ "White", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
	        } },
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
	        } },
			{ "Hunter Camo", "civ", {
	                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
	        } },
	        { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } }
        };
    };

	class B_Truck_01_covered_F {									//HEMTT Covered
		vItemSpace = 350;
		storageFee[] = { 25000, 25000, 25000, 25000 };
		garageSell[] = { 400000, 400000, 40000, 400000 };
		insurance = 2500;
		chopShop = 400000;
		textures[] = {};
	};
	
	class B_MRAP_01_F {												//Hunter
        vItemSpace = 65;
        storageFee[] = { 7500, 7500, 7500, 7500 };
		garageSell[] = { 100000, 100000, 100000, 100000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
        	{ "Police", "cop", {
                "textures\vehicles\cop\cop_hunter_body.paa",
				"textures\vehicles\cop\cop_hunter_back.paa"
            } },
            { "Rebel", "civ", {
                "\a3\soft_f\MRAP_01\data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\data\mrap_01_adds_co.paa"
            } },
			{ "DEA", "cop", {
                "textures\vehicles\cop\deahunterbody.paa",
				"textures\vehicles\cop\cop_hunter_back.paa"				
            },{"life_coplevel",4} },
			{ "SWAT", "cop", {
                "textures\vehicles\cop\swathunterbody.paa",
				"textures\vehicles\cop\cop_hunter_back.paa"
            },{"life_swatlevel",1} }
        };
    };

	class B_Heli_Light_01_F {										//MH-9 Hummingbird
        vItemSpace = 90;
        storageFee[] = { 2000, 2000, 2000, 2000 };
		garageSell[] = { 157000, 157000, 15700, 157000 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
			{ "Police", "cop", {
              "textures\vehicles\cop\heli_police.paa"
            } },
			{ "MSI", "civ", {
              "textures\vehicles\msi_humm.paa"
            },{"life_donator",1} },
			{ "ARC", "arc", {
              "textures\vehicles\arc\arc_humm.paa"
            } }			
        };
    };

	class B_Heli_Light_01_armed_F {									//AH-9 Pawnee
        vItemSpace = 20;
        storageFee[] = { 5000, 5000, 5000, 5000 };
		garageSell[] = { 180000, 180000, 180000, 180000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };

	class B_Heli_Transport_01_camo_F {								//Uh-80 Camo Ghosthawk
		vItemSpace = 200;
		storageFee[] = { 15000, 15000, 0, 15000 };
		garageSell[] = { 800000, 800000, 800000, 800000 };
		insurance = 16000;
		chopShop = 45000;
        textures[] = {};
    };
	
	class B_Heli_Transport_03_unarmed_F {								//HURRON
		vItemSpace = 150;
		storageFee[] = { 50000, 50000, 50000, 50000 };
		garageSell[] = { 150000, 150000, 150000, 150000 };
		insurance = 16000;
		chopShop = 450000;
        textures[] = {
			{ "ARC", "arc", {
                "textures\vehicles\arc\huron1.paa","textures\vehicles\arc\huron2.paa"
			} }
		};
	};			

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {};	

	class B_Boat_Armed_01_minigun_F {								//Speedboat Minigun
        vItemSpace = 175;
        storageFee[] = { 1500, 1500, 1500, 1500 };
		garageSell[] = { 0, 21000, 0, 21000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {									//UH80- Ghosthawk
		vItemSpace = 200;
		storageFee[] = { 10000, 10000, 10000, 10000 };
		garageSell[] = { 0, 85000, 0, 85000 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {
			{ "Police", "cop", {
                "textures\vehicles\cop\ghosthawk_01.paa","textures\vehicles\cop\ghosthawk_02.paa"
			} }
		};
	};

	class B_SDV_01_F {												//Cop SDV
        vItemSpace = 20;
        storageFee[] = { 400, 400, 400, 400 };
		garageSell[] = { 2500,2500, 0, 2500 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_medical_F : Default {							//Zamak Medical
		vItemSpace = 70;
		storageFee[] = { 3000, 3000, 3000, 3000 };
		garageSell[] = { 0, 0, 10000, 10000 };
		chopShop = 7500;
	};

	class O_Boat_Armed_01_hmg_F {									//Speedboat HMG
        vItemSpace = 175;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 21000, 21000, 21000, 21000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_transport_F {									//Tempest Transport
        vItemSpace = 285;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 115000, 1000, 1000, 115000 };
        insurance = 2500;
        chopShop = 115000;
        textures[] = { };
    };

	class O_Truck_03_ammo_F {										//Tempest Ammo
        vItemSpace = 400;
        storageFee[] = { 10000, 10000, 10000, 10000 };
		garageSell[] = { 135000, 135000, 135000, 135000 };
        insurance = 2500;
        chopShop = 135000;
        textures[] = { };
    };

	class O_MRAP_02_F {												//Iffrit
        vItemSpace = 60;
        storageFee[] = { 25000, 25000, 25000, 25000 };
		garageSell[] = { 65000, 0, 0, 65000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_covered_F {									//Tempest Covered
		vItemSpace = 300;
		storageFee[] = { 15000, 15000, 15000, 15000 };
		garageSell[] = { 65000, 0, 0, 65000 };
		insurance = 2500;
		chopShop = 5000;
		textures[] = {};
	};

	class O_Heli_Light_02_unarmed_F {								//PO-30 Orca Black
        vItemSpace = 210;
        storageFee[] = { 8000, 8000, 8000, 8000 };
		garageSell[] = { 300000, 0, 300000, 300000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
            { "EMS", "med", {
                "textures\vehicles\med\medic_orca.paa"
            } },
			{ "Police", "cop", {
                "textures\vehicles\cop\police_orca.paa"
            } },
			{ "ARC", "arc", {
                "textures\vehicles\arc\arcorca.paa"
            } },
			{ "Camo", "reb", {
                "textures\vehicles\arc\orca_rebel.paa"
            },{"life_donator",2} },		
        };
    };

	class O_Heli_Light_02_F {										//PO-30 Orca
		vItemSpace = 120;
        storageFee[] = { 8000, 8000, 8000, 8000 };
		garageSell[] = { 250000, 250000, 250000, 250000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
	};

	class O_Truck_03_device_F {										//Tempest (Device)
        vItemSpace = 550;
        storageFee[] = { 15000, 15000, 15000, 15000 };
		garageSell[] = { 185000, 0, 0, 185000 };
        insurance = 25000;
        chopShop = 125000;
        textures[] = {};
	};	

	class O_Heli_Transport_04_bench_F {								//Taru Bench
        vItemSpace = 140;
        storageFee[] = { 15000, 15000, 15000, 15000 };
		garageSell[] = { 750000, 0, 0, 75000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
	};

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		storageFee[] = { 500, 500, 500, 500 };
		garageSell[] = { 3500, 3500, 3500, 3500 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class	

	class C_Heli_Light_01_civil_F {								//M-900 Hummingbird
		vItemSpace = 150;
        storageFee[] = { 7500, 7500, 7500, 7500 };
		garageSell[] = { 25000, 25000, 25000, 25000 };
        insurance = 2500;
        chopShop = 15000;
        textures[] = {};
	};

	class C_Van_01_box_F {										//Van Box
        vItemSpace = 150;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 25000, 25000, 25000, 25000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "Ambulance", "med", {
				"textures\vehicles\med\ambulanceF.paa",
				"textures\vehicles\med\ambulanceB.paa"
            } }
        };
    };

	class C_Van_01_transport_F {								//Van
        vItemSpace = 100;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 25000, 0, 0, 25000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

	class C_SUV_01_F {											//SUV
        vItemSpace = 50;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 7000, 7000, 7000, 7000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Poly", "civ", {
                "textures\vehicles\poly_suv.paa"
            },{"life_donator",3} },
			{ "Police", "cop", {
                "textures\vehicles\cop\suv_police.paa"
            } },
			{ "Med", "med", {
                "textures\vehicles\med\suv_paramedic.paa"
            } },
			{ "Ferrari", "civ", {
                "textures\vehicles\suv_ferrari.paa"
            },{"life_donator",2} },
			{ "Flames", "civ", {
                "textures\vehicles\suv_flames.paa"
            },{"life_donator",2} },
			{ "Taxi", "civ", {
                "textures\vehicles\suv_taxi.paa"
            },{"life_donator",4} },
			{ "ARC", "arc", {
                "textures\vehicles\arc\suv_arc.paa"
            } },
			{ "Tron", "civ", {
                "textures\vehicles\suv_tron.paa"
            },{"life_donator",3} },	
			{ "Cola", "civ", {
                "textures\vehicles\suv_coca.paa"
            },{"life_donator",3} },
			{ "2-Pac", "civ", {
                "textures\vehicles\suv_2pac.paa"
            },{"life_donator",3} },
			{ "Graffiti", "civ", {
                "textures\vehicles\suv_graf.paa"
            },{"life_donator",3} }			
		};
    };

	class C_Hatchback_01_F {									//Civ Hatchback
        vItemSpace = 40;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 3500, 3500, 3500, 3500 };
        insurance = 2500;
        chopShop = 3000;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
			{ "Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
			{ "White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
			{ "Grey", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
			{ "Panda", "cop", {
                "textures\vehicles\cop\HighwaySportscar.paa"
            } }		
        };
    };

	class C_Hatchback_01_sport_F {								//Hatchback Sport
        vItemSpace = 45;
        storageFee[] = { 2000, 2000, 2000, 2000 };
		garageSell[] = { 15000, 15000, 15000, 15000 };
        insurance = 5500;
        chopShop = 4500;
        textures[] = {
        	{ "Red", "civ", {
              "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Dark Blue", "civ", {
	            "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Orange", "civ", {
	           "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
			{ "Black / White", "civ", {
	           "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
			{ "Beige", "civ", {
	           "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
			{ "Green", "civ", {
	           "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
			{ "Police", "cop", { 
				 "textures\vehicles\cop\HighwaySportscar.paa"
			} },
			{ "WRC", "civ", {
				 "textures\vehicles\civ_hatchback_wrc.paa"
            },{"life_donator",2} },
			{ "Redgull", "civ", {
				 "textures\vehicles\redgull_hatchbacks.paa" 
            },{"life_donator",2} },
			{ "Dayz", "civ", {
				 "textures\vehicles\dayz_hatchbacks.paa"
            },{"life_donator",3} },
			{ "RockStar", "civ", {
				 "textures\vehicles\rockhatch.paa"
            },{"life_donator",4} },	
			{ "MonsterWRC", "civ", {
				 "textures\vehicles\monsterwrchatch.paa"
            },{"life_donator",4} },			
			{ "Dragon", "civ", {
				 "textures\vehicles\dragon_sport.paa" 
            },{"life_donator",5} },
			{ "ARC", "arc", {
                "textures\vehicles\arc\archatchback.paa"
            } }				
		};
    };

	class C_Offroad_01_F {										//Civ Off-Road
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 6500, 6500, 6500, 6500 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Police", "cop", {
                "textures\vehicles\cop\offroad_police.paa"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Med", "med", {
                "textures\vehicles\med\offroad_paramedic.paa"
            } },
			{ "Monster", "civ", {
                "textures\vehicles\offroad_monster.paa"
            },{"life_donator",1} },
			{ "Captain", "civ", {
                "textures\vehicles\offroad_captain.paa"
            },{"life_donator",1} },
			{ "Drug", "civ", {
                "textures\vehicles\offroad_drug.paa"
            },{"life_donator",5} },
			{ "Monster2", "civ", {
                "textures\vehicles\monsteroffroad2.paa"
            },{"life_donator",5} },				
			{ "DEA", "cop", {
                "textures\vehicles\cop\offroad_dea.paa"
            },{"life_coplevel",5}},
			{ "SWAT", "cop", {
                "textures\vehicles\cop\offroad_swat.paa"
            },{"life_swatlevel",1} }
	    };
    };
	
	class C_Boat_Civil_01_police_F {							//Powerboat Police
        vItemSpace = 85;
        storageFee[] = { 3500, 3500, 3500, 3500 };
		garageSell[] = { 4900, 4900, 4900, 4900 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { "Police", "cop", {
                "textures\vehicles\cop\boat_police.paa"
			}}
		};
    };

	class C_Boat_Civil_01_rescue_F {							//Powerboat
        vItemSpace = 85;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
	};
	
	class C_Boat_Civil_01_F {									//Powerboat
        vItemSpace = 85;
        storageFee[] = { 3500, 3500, 3500, 3500 };
		garageSell[] = { 6800, 3500, 0, 6800 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class C_Rubberboat {										//Civ Rubberboat
        vItemSpace = 45;
        storageFee[] = { 400, 400, 400, 400 };
		garageSell[] = { 950, 950, 950, 950 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Truck_02_medical_F : Default {						//Zamak Medical
		vItemSpace = 60;
		storageFee[] = { 1500, 1500, 1500, 1500 };
		garageSell[] = { 5000, 5000, 5000, 5000 };
		chopShop = 3000;
	};


	
	class I_SDV_01_F {											//Reb SDV
        vItemSpace = 20;
        storageFee[] = { 400, 400, 400, 400 };
		garageSell[] = { 2500,2500, 2500, 2500 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class I_Boat_Armed_01_minigun_F {							//Speedboat Minigun
        vItemSpace = 175;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class Land_CargoBox_V1_F : Default {						//BOX
        vItemSpace = 5000;
    };

	class Box_IND_Grenades_F : Default {						//BOX
        vItemSpace = 350;
    };

	class B_supplyCrate_F {										//BOX
        vItemSpace = 700;
    };

	class I_G_Van_01_transport_F {								//Van
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_MRAP_03_F {											//Strider
        vItemSpace = 58;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Truck_02_covered_F {								//Zamak Covered
        vItemSpace = 250;
        storageFee[] = { 14500, 14500, 14500, 14500 };
		garageSell[] = { 62000, 62000, 62000, 62000 };
        insurance = 6500;
        chopShop = 40000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "ARC", "arc", {
                "textures\vehicles\arc\arczam1.paa","textures\vehicles\arc\arczam2.paa"
			} }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {		//Zamak Transport
        vItemSpace = 200;
        storageFee[] = { 12000, 0, 0, 12000 };
		garageSell[] = { 49800, 3500, 0, 49800 };
    };

	class I_Heli_Light_03_F {									//WY-55 Hellcat
        vItemSpace = 115;
        storageFee[] = { 15000, 15000, 15000, 15000 };
		garageSell[] = { 150000, 150000, 150000, 150000 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {
        	{ "Police", "cop", {
               "textures\vehicles\cop\cop_hellcat.paa"
            } }
		};	
	};
	class I_Heli_Transport_02_F {								//CH-49 Mohawk
        vItemSpace = 375;
        storageFee[] = { 15000, 15000, 15000, 15000 };
		garageSell[] = { 125000, 125000, 125000, 125000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
        	{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } },
			{ "Proph", "civ", {
                "textures\vehicles\MohawkDoors.paa",
                "textures\vehicles\Mohawkmiddle.paa",
                "textures\vehicles\Mohawksides.paa"				
            },{"life_donator",5} },
        };
    };
};