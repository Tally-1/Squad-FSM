params[
	["_ignorePlayers",nil,[true]]
];

private _isPlayer = _self call ["isPlayerGroup"];
private _denyPlayer = (!_ignorePlayers)&&{_isPlayer};
if(_denyPlayer)exitWith{false};

private _hasAbility = _self get "canCallArty";
if(!_hasAbility)exitWith{false};

private _timeSinceLast = _self call ["artilleryTimeSinceRequest"];
private _minimum       = selectMax[SQFM_artyCooldown,SQFM_artyCallCooldown,10];
private _tooSoon       = _timeSinceLast<_minimum;
if(_tooSoon)exitWith{false};

private _artySquads = _self call ["getArtySquads"];
private _noArty     = _artySquads isEqualTo [];
if(_noArty)exitWith{false};

private _activeRequest = _self call ["isWaitingForArtillery"];
if(_activeRequest)exitWith{false};

private _valid = _self call ["isValid"];
if(!_valid)exitWith{false};

true;