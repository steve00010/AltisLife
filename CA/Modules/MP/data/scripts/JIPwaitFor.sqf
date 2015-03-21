scriptName "MP\data\scripts\JIPwaitFor.sqf";

if (!isServer) then
{
  //textLogFormat ["INIT_INITJIP JIPwaitFor 0 %1", time,player];
  waitUntil {!isNil {player}};
  //textLogFormat ["INIT_INITJIP JIPwaitFor 1 %1", time,player];
  waitUntil {!isNull player};
  ///textLogFormat ["INIT_INITJIP JIPwaitFor 2 %1", time,player];
  if (player != player) then
  {	      
      waitUntil {!(player != player)};
  };
  //textLogFormat ["INIT_INITJIP JIPwaitFor.sqf (CLIENT)  %1", [time,player]];
};
