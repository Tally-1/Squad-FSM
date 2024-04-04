private _self         = _this;
private _timer        = time + 60;
private _battleActive = true;

waitUntil{sleep 1; count (_self get "groupShots") > 0 || {_timer < time}};

if(count (_self get "groupShots") isEqualTo 0)
exitWith{_self call ["endBattle"]};

while {_battleActive} do {
	if!(_battleActive)exitWith{};
	
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