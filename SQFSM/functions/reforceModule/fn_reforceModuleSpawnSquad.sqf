private _virtualSquads = _self get "virtualSquads";
private _virtualSquad  = selectRandom _virtualSquads;
private _physicalSquad = (_virtualSquad call ["spawnIn"]);
private _squadData     = _physicalSquad call getData;
private _totalCount    = (_self get "sentCount")+1;

(_self get "squads_ingame")pushBack _physicalSquad;
_self set ["sentCount", _totalCount];
_self set ["last_spawn", round time];

if(isNil "_squadData")then{
	_physicalSquad spawn{
	private _timer = time+10;
	waitUntil {(!isNil{_this call getData}) or time>_timer};
	private _squadData = _this call getData;

	_squadData set ["canReinforce",       true];
	_squadData set ["exclude",           false];
	_squadData set ["birth",             0-300];
	_squadData set ["lastTransportCall", 0-300];
	_squadData set ["huntCoolDown",      0-300];
	_squadData set ["lastFireCheck",     0-300];
};

}else{
	_squadData set ["canReinforce",       true];
	_squadData set ["exclude",           false];
	_squadData set ["birth",             0-300];
	_squadData set ["lastTransportCall", 0-300];
	_squadData set ["huntCoolDown",      0-300];
	_squadData set ["lastFireCheck",     0-300];

};
_physicalSquad setVariable ["SQFM_Excluded", false, true];

_physicalSquad;