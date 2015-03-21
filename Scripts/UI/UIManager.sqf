
While {(local player)} do
{
		WaitUntil {(visibleMap);};
		DAP_BF_MAPSTATE=1;
		
		CutRsc ["DAP_BF_UI","PLAIN",0.01];
		
		if (MAXTIME==0) then
   		{
			((HUDDisplay select 0) displayCtrl 51001) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51002) ctrlShow false;
		}
		else
		{
			((HUDDisplay select 0) displayCtrl 51001) ctrlShow true;
			((HUDDisplay select 0) displayCtrl 51002) ctrlShow true;
		};
	
		WaitUntil {(!(visibleMap));};
		DAP_BF_MAPSTATE=0;
		((HUDDisplay select 0) displayCtrl 51001) ctrlShow false;
		((HUDDisplay select 0) displayCtrl 51002) ctrlShow false;
};
