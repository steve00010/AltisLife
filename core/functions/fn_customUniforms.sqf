	#define __GETC__(var) (call var)

if (playerSide == west) then
{
	if(uniform player == "U_Rangemaster") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\Marshall_uniform.paa"];
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
	sleep 1;
	//player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.paa"];
	player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.paa"];

	_Count = 0;
	while {_Count < 5} do
	{
		//player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.paa"];
		player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.paa"];
		_Count = _Count + 1;
		sleep 2;
	};
};

// Make Backpack invisible
if ( (playerSide == independent) or (playerSide == west) ) then
{
	if(backpack player != "") then 
	{
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};
if (playerSide == civilian) then {
	if (uniform player == "U_C_WorkerCoveralls") then {
		player setObjectTextureGlobal [0,"textures\uniforms\prisoner_uniform.paa"];
	};
};