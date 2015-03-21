//Allow player to respawn with his loadout? If true unit will respawn with all ammo from initial save! Set to false to disable this and rely on other scripts!
vas_onRespawn = false;
//Preload Weapon Config?
vas_preload = true;
//If limiting weapons its probably best to set this to true so people aren't loading custom loadouts with restricted gear.
vas_disableLoadSave = false;
//Amount of save/load slots
vas_customslots = 9; //9 is actually 10 slots, starts from 0 to whatever you set, so always remember when setting a number to minus by 1, i.e 12 will be 11.

/*
	NOTES ON EDITING!
	YOU MUST PUT VALID CLASS NAMES IN THE VARIABLES IN AN ARRAY FORMAT, NOT DOING SO WILL RESULT IN BREAKING THE SYSTEM!
	PLACE THE CLASS NAMES OF GUNS/ITEMS/MAGAZINES/BACKPACKS/GOGGLES IN THE CORRECT ARRAYS! TO DISABLE A SELECTION I.E
	GOGGLES vas_goggles = [""]; AND THAT WILL DISABLE THE ITEM SELECTION FOR WHATEVER VARIABLE YOU ARE WANTING TO DISABLE!
	
														EXAMPLE
	vas_weapons = ["srifle_EBR_ARCO_point_grip_F","arifle_Khaybar_Holo_mzls_F","arifle_TRG21_GL_F","Binocular"];
	vas_magazines = ["30Rnd_65x39_case_mag","20Rnd_762x45_Mag","30Rnd_65x39_caseless_green"];
	vas_items = ["ItemMap","ItemGPS","NVGoggles"];
	vas_backpacks = ["B_Bergen_sgg_Exp","B_AssaultPack_rgr_Medic"];
	vas_goggles = [""];											
*/
	vas_weapons = ["LMG_Mk200_F","arifle_MX_SW_F","arifle_MX_GL_F","arifle_MX_F","arifle_MXC_F","arifle_MXM_F","SMG_02_F","SMG_01_F","hgun_Pistol_heavy_01_F","hgun_P07_F","srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","Binocular","Rangefinder"];
	vas_magazines = ["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","20Rnd_762x51_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_9x21_Mag","16Rnd_9x21_Mag","11Rnd_45ACP_Mag","5Rnd_127x108_Mag","7Rnd_408_Mag","HandGrenade","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"];
	vas_items = ["NVGoggles","ToolKit","Medikit","FirstAidKit","B_UavTerminal","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrierGL_rgr","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_tshirt","U_B_HeliPilotCoveralls","U_B_GhillieSuit","H_PilotHelmetHeli_B","H_HelmetB","H_HelmetB_paint","H_HelmetB_light","H_Shemag_khk","H_Cap_headphones","H_Cap_tan_specops_US","H_Booniehat_khk","H_Beret_blk","H_Watchcap_blk","optic_SOS","optic_Arco","optic_Hamr","optic_MRCO","optic_Aco","optic_Aco_smg","optic_ACO_grn","optic_ACO_grn_smg","optic_MRD","acc_pointer_IR","acc_flashlight","muzzle_snds_H_MG","muzzle_snds_B","muzzle_snds_H","muzzle_snds_acp","muzzle_snds_L"];
	vas_backpacks = ["B_Kitbag_sgg","B_Bergen_sgg","B_AssaultPack_sgg","B_UAV_01_backpack_F"];
	vas_glasses = [];
/*
	NOTES ON EDITING:
	THIS IS THE SAME AS THE ABOVE VARIABLES, YOU NEED TO KNOW THE CLASS NAME OF THE ITEM YOU ARE RESTRICTING. THIS DOES NOT WORK IN 
	CONJUNCTION WITH THE ABOVE METHOD, THIs IS ONLY FOR RESTRICTING / LIMITING ITEMS FROM VAS AND NOTHING MORE
	
														EXAMPLE
	vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
	vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
	vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
*/

//Below are variables you can use to restrict certain items from being used.
//Remove Weapon
vas_r_weapons = [];
vas_r_backpacks = [];
//Magazines to remove from VAS
vas_r_magazines = [];
//Items to remove from VAS
vas_r_items = [];
//Goggles to remove from VAS
vas_r_glasses = [];
