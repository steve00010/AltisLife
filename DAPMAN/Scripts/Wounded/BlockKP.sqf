private['_handled'];
_handled = false;
_dikCode = (_this select 1);

if (_dikCode in (ActionKeys "moveFastForward")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveForward")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "turnLeft")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "turnRight")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "evasiveLeft")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "evasiveRight")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "stand")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "crouch")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveUp")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveDown")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "Salute")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "sitDown")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "sitDown")) then
	{
		_handled = true;
	};	
	
if (player != (vehicle player)) then 
{
	if (_dikCode in (ActionKeys "AimHeadDown")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimHeadLeft")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimHeadRight")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimHeadUp")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimingHead")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimLeft")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimRight")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimUp")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "AimDown")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarAimDown")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarAimLeft")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarAimRight")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarAimUp")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarBack")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarFastForward")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarForward")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarLeft")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "CarRight")) then
	{
		_handled = true;
	};
	if (_dikCode in (ActionKeys "Fire")) then
	{
		_handled = true;
	};
};
_handled;

