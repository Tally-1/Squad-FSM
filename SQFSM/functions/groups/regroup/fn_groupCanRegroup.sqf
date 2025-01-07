if(typeName _this != "ARRAY")exitWith{false};
if(!SQFM_allowRegroup)       exitWith{false};
params [
    ["_includePlayers",false,[true]],
    ["_menOnFoot",     nil,    [[]]]
];
private _tooSoon = (_self call ["timeSinceRegroup"])<SQFM_regroupInterval;
if(_tooSoon)exitWith{false};

private _regrouping = _self get "regrouping";
if(_regrouping)exitWith{false};

private _isPlayer = (!_includePlayers) && {_self call ["isPlayerGroup"]};
if(_isPlayer)exitWith{false};

if(isNil "_menOnFoot")then{
	private _params = [false, false, false, false];
	_menOnFoot = _self call["getFunctionalMen", _params];
};

if(count _menOnFoot<1)exitWith{false};

// Setting the time limit here in order to avoid unecesary checks on excluded groups.
_self set ["lastRegroup", round time];

private _invalid = !(_self call ["isValid"]);
if(_invalid)exitWith{false};

true;