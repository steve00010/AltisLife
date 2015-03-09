class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" }, 
			{ "C_Hatchback_01_F", 6500, "driver" }, 
			{ "C_Offroad_01_F", 7500, "driver" },
			{ "C_SUV_01_F", 10000, "driver" },
			{ "C_Hatchback_01_sport_F", 30000, "driver", { "life_donator", 3 }},
			{ "C_Van_01_transport_F", 25000, "driver" }
		};
	};
	
	class arc_car {
		side = "arc";
		vehicles[] = { 
			{ "B_G_Offroad_01_F", 7500, "" },
			{ "B_Truck_01_mover_F", 200000, "" },
			{ "I_Truck_02_covered_F", 150000, "" },
			{ "C_SUV_01_F", 10000, "" },
			{ "O_Truck_03_device_F", 1000000, "", { "life_donator", 5 }},			
			{ "C_Hatchback_01_sport_F", 30000, "", { "life_donator", 3 }}		
		};
	};
	
	class arc_air {
		side = "arc";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "" },
			{ "B_Heli_Transport_03_unarmed_F", 1300000, "" },
			{ "O_Heli_Light_02_unarmed_F", 500000, "", { "life_donator", 2 }}			
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

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", 20000, "trucking" },
			{ "I_Truck_02_transport_F", 125000, "trucking" },
			{ "I_Truck_02_covered_F", 150000, "trucking" },
			{ "O_Truck_03_ammo_F", 300000, "trucking" },
			{ "O_Truck_03_transport_F", 300000, "trucking",{ "life_donator", 1 } },
			{ "O_Truck_03_covered_F", 450000, "trucking",{ "life_donator", 2 } },
			{ "B_Truck_01_transport_F", 450000, "trucking",{ "life_donator", 3 } },
			{ "O_Truck_03_device_F", 600000, "trucking",{ "life_donator", 4 } },
			{ "B_Truck_01_covered_F", 800000, "trucking",{ "life_donator", 5 } }			

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
	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", 5000, ""},
			{ "C_SUV_01_F", 10000, "" },
			{ "C_Hatchback_01_F", 6500, "" }, 
			{ "C_Hatchback_01_sport_F", 40000, "", { "life_donator", 3 } },
			{ "B_MRAP_01_F", 175000, "", { "life_coplevel", 4 } }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "pilot" },
			{ "C_Heli_Light_01_civil_F", 253000, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", 500000, "pilot", { "life_donator", 2 } },
		};
	};
	class reb_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "" },
			{ "B_Heli_Light_01_armed_F", 253000, "" },
			{ "O_Heli_Transport_04_bench_F", 2750000, "" },
			{ "O_Heli_Light_02_F",800000, "", { "life_donator", 2 } },
			{ "B_Heli_Transport_01_camo_F", 1800000, "", { "life_donator", 5 } },
		};
	};
	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, "cAir",{ "life_coplevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, "cAir", { "life_donator", 2 } },
			{ "B_Heli_Transport_01_F", 2000000, "cAir", { "life_donator", 5 } },
			{ "I_Heli_light_03_F", 1000000, "cAir", { "life_coplevel", 5 } }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, "cAir",{ "life_coplevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, "cAir", { "life_donator", 2 } },
			{ "B_Heli_Transport_01_F", 2000000, "cAir", { "life_donator", 5 } },
			{ "I_Heli_light_03_F", 1000000, "cAir", { "life_coplevel", 5 } }
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

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 5000, "boat" },
			{ "C_Boat_Civil_01_F", 22000, "boat" },
			{ "B_SDV_01_F", 150000, "boat" }
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
		storageFee[] = { 0, 0, 6500, 0 };
		garageSell[] = { 0, 0, 25000, 0 };
		chopShop = 12500;
	};
	
	class B_MRAP_01_hmg_F : Default {								//Hunter HMG
		vItemSpace = 100;
	};

	class B_Boat_Transport_01_F {									//Assault Boat
        vItemSpace = 45;
        storageFee[] = { 0, 450, 0, 450 };
		garageSell[] = { 0, 850, 0, 850 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class B_Truck_01_mover_F {										//HEMTT Mover
        vItemSpace = 100;
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
        storageFee[] = { 2500, 0, 0, 2500 };
		garageSell[] = { 235000, 0, 0, 200000 };
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
        storageFee[] = { 2500, 0, 0, 2500 };
		garageSell[] = { 235000, 0, 0, 235000 };
        insurance = 2500;
        chopShop = 235000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {									//Assault Boat						
        vItemSpace = 45;
        storageFee[] = { 1000, 0, 0, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Offroad_01_F {										//Off-Road
        vItemSpace = 65;
        storageFee[] = { 1000, 0, 0, 1000 };
		garageSell[] = { 3500, 0, 0, 3500 };
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
        storageFee[] = { 35000, 0, 0, 35000 };
		garageSell[] = { 150000, 0, 0, 150000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = { };
    };

	class B_Quadbike_01_F {											//Quadbike
        vItemSpace = 25;
        storageFee[] = { 1000, 0, 0, 1000 };
		garageSell[] = { 950, 0, 0, 950 };
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
		storageFee[] = { 25000, 0, 0, 25000 };
		garageSell[] = { 400000, 0, 0, 400000 };
		insurance = 2500;
		chopShop = 400000;
		textures[] = {};
	};
	
	class B_MRAP_01_F {												//Hunter
        vItemSpace = 65;
        storageFee[] = { 0, 7500, 0, 7500 };
		garageSell[] = { 0, 10000, 0, 10000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
        	{ "Police", "cop", {
                "textures\vehicles\cop_hunter_body.paa",
				"textures\vehicles\cop_hunter_back.jpg"
            } },
            { "Rebel", "civ", {
                "\a3\soft_f\MRAP_01\data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\data\mrap_01_adds_co.paa"
            } },
			{ "DEA", "cop", {
                "textures\vehicles\deahunterbody.paa",
				"textures\vehicles\cop_hunter_back.jpg"				
            },{"life_coplevel",4} },
			{ "SWAT", "cop", {
                "textures\vehicles\swathunterbody.paa",
				"textures\vehicles\cop_hunter_back.jpg"
            },{"life_swatlevel",1} }
        };
    };

	class B_Heli_Light_01_F {										//MH-9 Hummingbird
        vItemSpace = 90;
        storageFee[] = { 10000, 19500, 0, 10000 };
		garageSell[] = { 157000, 35000, 0, 157000 };
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
              "textures\vehicles\heli_police.paa"
            } },
			{ "MSI", "civ", {
              "textures\vehicles\msi_humm.paa"
            } },
			{ "ARC", "arc", {
              "textures\vehicles\arc\arc_humm.paa"
            } }			
        };
    };

	class B_Heli_Light_01_armed_F {									//AH-9 Pawnee
        vItemSpace = 20;
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 180000, 0, 0, 180000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };

	class B_Heli_Transport_01_camo_F {								//Uh-80 Camo Ghosthawk
		vItemSpace = 200;
		storageFee[] = { 25000, 25000, 0, 25000 };
		garageSell[] = { 800000, 800000, 0, 800000 };
		insurance = 16000;
		chopShop = 45000;
        textures[] = {};
    };
	
	class B_Heli_Transport_03_unarmed_F {								//HURRON
		vItemSpace = 150;
		storageFee[] = { 50000, 0, 0, 50000 };
		garageSell[] = { 150000, 0, 0, 150000 };
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
        storageFee[] = { 0, 16500, 0, 16500 };
		garageSell[] = { 0, 21000, 0, 21000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {									//UH80- Ghosthawk
		vItemSpace = 200;
		storageFee[] = { 0, 50000, 0, 50000 };
		garageSell[] = { 0, 85000, 0, 85000 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {
			{ "Police", "cop", {
                "textures\vehicles\ghosthawk_01.paa","textures\vehicles\ghosthawk_02.paa"
			} }
		};
	};

	class B_SDV_01_F {												//Cop SDV
        vItemSpace = 20;
        storageFee[] = { 400, 300, 0, 400 };
		garageSell[] = { 2500,2500, 0, 2500 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_medical_F : Default {							//Zamak Medical
		vItemSpace = 70;
		storageFee[] = { 0, 0, 3000, 3000 };
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
        storageFee[] = { 12650, 12650, 12650, 12650 };
		garageSell[] = { 135000, 135000, 135000, 135000 };
        insurance = 2500;
        chopShop = 135000;
        textures[] = { };
    };

	class O_MRAP_02_F {												//Iffrit
        vItemSpace = 60;
        storageFee[] = { 45000, 0, 0, 45000 };
		garageSell[] = { 65000, 0, 0, 65000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_covered_F {									//Tempest Covered
		vItemSpace = 300;
		storageFee[] = { 25000, 0, 0, 25000 };
		garageSell[] = { 65000, 0, 0, 65000 };
		insurance = 2500;
		chopShop = 5000;
		textures[] = {};
	};

	class O_Heli_Light_02_unarmed_F {								//PO-30 Orca Black
        vItemSpace = 210;
        storageFee[] = { 25000, 0, 22000, 22000 };
		garageSell[] = { 500000, 0, 35000, 35000 };
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
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "Police", "cop", {
                "textures\vehicles\police_orca.paa"
            } },
			{ "ARC", "arc", {
                "textures\vehicles\arc\arcorca.paa"
            } }
        };
    };

	class O_Heli_Light_02_F {										//PO-30 Orca
		vItemSpace = 120;
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 25000, 0, 0, 25000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
	};

	class O_Truck_03_device_F {										//Tempest (Device)
        vItemSpace = 550;
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 185000, 0, 0, 185000 };
        insurance = 25000;
        chopShop = 125000;
        textures[] = {};
	};	

	class O_Heli_Transport_04_bench_F {								//Taru Bench
        vItemSpace = 140;
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 750000, 0, 0, 75000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
	};

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		storageFee[] = { 1500, 0, 0, 1500 };
		garageSell[] = { 3500, 0, 0, 3500 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class	

	class C_Heli_Light_01_civil_F {								//M-900 Hummingbird
		vItemSpace = 150;
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 25000, 0, 0, 25000 };
        insurance = 2500;
        chopShop = 15000;
        textures[] = {};
	};

	class C_Van_01_box_F {										//Van Box
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 1000 };
		garageSell[] = { 35000, 0, 0, 35000 };
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
				"textures\vehicles\ambulanceF.paa",
				"textures\vehicles\ambulanceB.paa"
            } }
        };
    };

	class C_Van_01_transport_F {								//Van
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 1000 };
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
        storageFee[] = { 1000, 0, 0, 1000 };
		garageSell[] = { 15000, 7500, 0, 15000 };
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
            } },
			{ "Police", "cop", {
                "textures\vehicles\suv_police.paa"
            } },
			{ "Med", "med", {
                "textures\vehicles\suv_paramedic.paa"
            } },
			{ "Ferrari", "civ", {
                "textures\vehicles\suv_ferrari.paa"
            } },
			{ "Flames", "civ", {
                "textures\vehicles\suv_flames.paa"
            } },
			{ "Flames", "civ", {
                "textures\vehicles\suv_camo.paa"
            } },
			{ "Taxi", "civ", {
                "textures\vehicles\suv_taxi.paa"
            } },
			{ "ARC", "arc", {
                "textures\vehicles\arc\suv_arc.paa"
            } }			
	    };
    };

	class C_Hatchback_01_F {									//Civ Hatchback
        vItemSpace = 40;
        storageFee[] = { 1000, 0, 0, 1000 };
		garageSell[] = { 4500, 3500, 0, 45000 };
        insurance = 2500;
        chopShop = 5000;
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
                "textures\vehicles\HighwaySportscar.paa"
            } }		
        };
    };

	class C_Hatchback_01_sport_F {								//Hatchback Sport
        vItemSpace = 45;
        storageFee[] = { 2500, 1000, 0, 30000 };
		garageSell[] = { 15000, 7500, 0, 15000 };
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
				 "textures\vehicles\HighwaySportscar.paa"
			} },
			{ "WRC", "civ", {
				 "textures\vehicles\civ_hatchback_wrc.paa"
			} },
			{ "Redgull", "civ", {
				 "textures\vehicles\redgull_hatchbacks.paa" 
			} }, 
			{ "Dayz", "civ", {
				 "textures\vehicles\dayz_hatchbacks.paa"
	        } },
			{ "Dragon", "civ", {
				 "textures\vehicles\dragon_sport.paa" 
			} },
			{ "ARC", "arc", {
                "textures\vehicles\arc\archatchback.paa"
            } }				
		};
    };

	class C_Offroad_01_F {										//Civ Off-Road
        vItemSpace = 65;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 6500 };
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
                "textures\vehicles\offroad_police.paa"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Med", "med", {
                "textures\vehicles\offroad_paramedic.paa"
            } },
			{ "Monster", "civ", {
                "textures\vehicles\offroad_monster.paa"
            } },
			{ "Captain", "civ", {
                "textures\vehicles\offroad_captain.paa"
            } },
			{ "Drug", "civ", {
                "textures\vehicles\offroad_drug.paa"
            } },			
			{ "DEA", "cop", {
                "textures\vehicles\offroad_dea.paa"
            },{"life_coplevel",5}},
			{ "SWAT", "cop", {
                "textures\vehicles\offroad_swat.paa"
            },{"life_swatlevel",1} }
	    };
    };
	
	class C_Boat_Civil_01_police_F {							//Powerboat Police
        vItemSpace = 85;
        storageFee[] = { 0, 3500, 0, 3500 };
		garageSell[] = { 0, 4950, 0, 4950 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { "Police", "cop", {
                "textures\vehicles\boat_police.paa"
			}}
		};
    };

	class C_Boat_Civil_01_rescue_F {							//Powerboat
        vItemSpace = 85;
        storageFee[] = { 1000, 0, 0, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
	};
	
	class C_Boat_Civil_01_F {									//Powerboat
        vItemSpace = 85;
        storageFee[] = { 6800, 3500, 0, 4500 };
		garageSell[] = { 6800, 3500, 0, 6800 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class C_Rubberboat {										//Civ Rubberboat
        vItemSpace = 45;
        storageFee[] = { 400, 400, 0, 400 };
		garageSell[] = { 950, 950, 0, 350 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Truck_02_medical_F : Default {						//Zamak Medical
		vItemSpace = 60;
		storageFee[] = { 0, 0, 1500, 1500 };
		garageSell[] = { 0, 0, 5000, 5000 };
		chopShop = 3000;
	};


	
	class I_SDV_01_F {											//Reb SDV
        vItemSpace = 20;
        storageFee[] = { 400, 400, 0, 400 };
		garageSell[] = { 2500,2500, 0, 2500 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class I_Boat_Armed_01_minigun_F {							//Speedboat Minigun
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 1000 };
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
        storageFee[] = { 1000, 0, 0, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Truck_02_covered_F {								//Zamak Covered
        vItemSpace = 250;
        storageFee[] = { 14500, 0, 0, 14500 };
		garageSell[] = { 62000, 0, 0, 62000 };
        insurance = 6500;
        chopShop = 20000;
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
        storageFee[] = { 15000, 0, 0, 15000 };
		garageSell[] = { 150000, 0, 0, 150000 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {
        	{ "Police", "cop", {
               "textures\vehicles\cop_hellcat.paa"
            } }
		};	
	};
	class I_Heli_Transport_02_F {								//CH-49 Mohawk
        vItemSpace = 375;
        storageFee[] = { 15000, 0, 15000, 15000 };
		garageSell[] = { 125000, 0, 50000, 50000 };
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
			} }
        };
    };
};