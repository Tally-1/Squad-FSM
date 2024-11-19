private _self         = _this;
private _timer        = time + 20;
private _battleActive = true;
private _noGlobal     = (isDedicated &&{!SQFM_battlePublicVar});

if(_noGlobal)then{_timer = time-1};

if(!isDedicated)then{
waitUntil{
	sleep 1; 
	count (_self get "groupShots") > 0 
	|| {_timer < time}
}};

if(count (_self get "groupShots") isEqualTo 0
&&{!isDedicated})exitWith{_self call ["endBattle"]};

while {_battleActive} do { 
	if!(_battleActive)exitWith{};
	
	private _forcedEnd = _self get "forcedEnd";
	if(_forcedEnd)
	exitWith{_battleActive = false};

	_self call ["update"];

	private _activeSides = count(_self get "sides");
	if(_activeSides < 2)
	exitWith{_battleActive = false};

	private _timeSinceShot = _self call ["timeSinceShot"];
	if(_timeSinceShot > 120)
	exitWith{_battleActive = false};
	
	sleep 10;
};

_self call ["endBattle"];