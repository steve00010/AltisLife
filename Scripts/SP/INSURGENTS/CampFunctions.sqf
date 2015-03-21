private ["_units","_dir","_n"];

_unitsarray = _this select 0;
_center = _this select 1;

_firepitsarray = (nearestObjects [_center,["FirePlace_burning_F"],DAP_MARKERSIZE]);
if ((count _firepitsarray) > 0)then 
{
	_campfire = (_firepitsarray select 0);
	_units = _unitsarray;
	_pos = (getPos _campfire);
	_dir = 0;
	_n = 0;
	
	if ((count _unitsarray)>5)then 
	{
		if ((count _unitsarray)>10) then 
		{
			_n = 6;
		}
		else
		{
			_n = 4;
		};
	}
	else
	{
		_n = 2;	
	};
	
	for "_i" from 0 to _n do
	{
    		_range = (1.5+(random 1));
    		    
    		_unitpos = [((_pos select 0)+_range*(sin(_dir))), ((_pos select 1)+_range*(cos(_dir))), 0];
    		_dir = (_dir + (360/(_n+1)));
    		
    		_unit = (_unitsarray select _i);
        	_unit setDir (_dir+(90+(360/(_n+1))));
    		_unit setPos _unitpos;
    
		_unit doWatch _campfire;
		sleep 0.5;
		
		_unit setBehaviour "SAFE";
		_unit playMoveNow "AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon";

    		_units = _units - [_unit];
    	};

    	_dir = 0;
    	
    	{
		
		_dir = (_dir + (360/(count _units)));
		_range = (15+(random 30));
			
		_xpos = [(_center select 0)+_range*sin(_dir), (_center select 1)+_range*cos(_dir),0];
		_x setPos _xpos;
			
		_x dowatch objNull;
		_x setDir (_dir+275+(360/(count _units)));
			
		sleep 0.05;
				
	}ForEach _units;
};