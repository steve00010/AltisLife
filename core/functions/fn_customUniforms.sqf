

if (playerSide == west) then
{
	if(uniform player == "U_Rangemaster") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\Marshall_uniform.jpg"];
	};

	if(uniform player == "U_B_CombatUniform_mcam_worn") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\swat_shirt.jpg"];
	};
	
	if(uniform player == "U_B_HeliPilotCoveralls") then 
	{
		player setObjectTextureGlobal [0,"textures\uniforms\pilot_uniform.jpg"];
	};
};

if (playerSide == independent) then
{
	sleep 1;
	//player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.jpg"];
	player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.jpg"];

	_Count = 0;
	while {_Count < 5} do
	{
		//player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.jpg"];
		player setObjectTextureGlobal [0,"textures\uniforms\medic_uniform.jpg"];
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