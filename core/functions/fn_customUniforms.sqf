

if (playerSide == west) then
{
	if(uniform player == "U_Rangemaster") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\Marshall_uniform.jpg"];
	};

	if(uniform player == "U_B_CombatUniform_mcam_worn") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\senior_shirt.paa"];
	};
	
	if(uniform player == "U_B_HeliPilotCoveralls") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\pilot_uniform.paa"];
	};
	
	if(uniform player == "U_B_CTRG_1")  then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\cop\P_Uniform_SWAT.paa"];
	};
	
	if(uniform player == "U_B_CTRG_3")  then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\cop\dea.paa"];
	};	
};

if (playerSide == independent) then
{
	if((backpack player) == "B_Carryall_mcamo") then {
		
		(unitBackpack player) setObjectTextureGlobal [0,"textures\uniforms\mediccarryall.paa"];
	};

	if(uniform player == "U_B_CombatUniform_mcam_worn") then
	{
		player setObjectTextureGlobal [0,"textures\uniforms\nhsuniform.paa"];
	};
	
};

// Make Backpack invisible
if (playerSide == west) then
{
	if(backpack player != "") then 
	{
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};

if (playerSide == civilian) then {
	if (uniform player == "U_C_WorkerCoveralls") then {
		player setObjectTextureGlobal [0,"textures\uniforms\prisoner_uniform.jpg"];
	};
	
	if(uniform player == "U_Rangemaster") then {
		player setObjectTextureGlobal [0,"textures\uniforms\arc_junior.paa"];
		player setObjectTextureGlobal [0,"textures\uniforms\arc_senior.paa"];
	};
};