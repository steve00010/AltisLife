_man = _this select 0;
_id = _this select 2;
_man removeaction _id;

_bomb= "Sh_120_HE" createVehicle [(getPos _man select 0)+1*sin(getDir _man),(getPos _man select 1)+1*cos(getDir _man)];
_bomb setVelocity [0,0,-1000];