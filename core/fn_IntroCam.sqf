

private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];
_camDistance = 100;
_randCamX = 45 - floor(random 150);
_randCamY = 45 - floor(random 150);
_camTime = 8;
player say3D "introsong";

showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 1.500;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

