params[
    ["_reason",nil, [""]]
];
private _data      = group player call getData;
private _incoming  = _data get "incomingReforce";
private _noReforce = _incoming isEqualTo [];
if(_noReforce)exitWith{false};

private _dbgMsg       = [["(",name player,") aborted reinforcements"]];
private _reforceGroup = _incoming#0;
[
    "SQFM_playerAbortReforce",
    [
        player, 
        _reforceGroup
    ]

] call CBA_fnc_serverEvent;

if(!isNil "_reason")
then{_dbgMsg = [[name player, " ", _reason]]};

_incoming deleteAt (_incoming find _reforceGroup);

_dbgMsg call dbgs;
_dbgMsg call dbgm;

true;