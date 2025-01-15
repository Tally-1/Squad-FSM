params[
    ["_groupsMap", nil, [createHashmap]],
    ["_side",      nil,          [west]]
];


private _available = _groupsMap call ["getAvailable",["reinforcements", _side]];
// if(_available isEqualTo [])exitWith{};

private _requestList      = SQFM_reinforRequests get _side;
if(isNil "_requestList")exitWith{};

private _sortedRequests   = [_requestList, [], {_x#2}, "ASCEND"] call BIS_fnc_sortBy;
private _requesterGroups  = _requestList apply {_x#1};
private _assignedGroups   = [];
private _assignedRequests = [];
private _requestResponses = [];

// systemChat str _requesterGroups;
// _assignedGroups append _requesterGroups;

{
    _available = _available select {
        private _isRequesting    = _x in _requesterGroups;
        private _alreadyAssigned = _x in _assignedGroups;
        private _valid           = _isRequesting == false && {_alreadyAssigned == false && {!isNull _x}};

        _valid;
    };

    // Use respawn module if needed and available.
    private _callPos   = _x#0;
    private _caller    = _x#1;
    private _callTime  = _x#2;

    if(_available isEqualTo [])then{
        private _newGroup = [_callPos, _caller] call SQFM_fnc_moduleSpawnOnReforceRequest;
        _available = if(isNull _newGroup)
        then{[]}
        else{[_newGroup]};
    };

    if(_available isEqualTo [])exitWith{};
    private _responder = [_callPos, _available] call SQFM_fnc_getNearestGroup;
    private _data      = _responder call getData;
    if(isNil "_data")exitWith{};
    
    _assignedGroups   pushBackUnique _responder;
    _assignedRequests pushBackUnique _x;

    _data call ["reinforce", [_callPos, _caller, _callTime]];
    
} forEach _sortedRequests;


private _deniedRequests = _requestList select {!(_x in _assignedRequests)};
[_assignedRequests, true, _side] call SQFM_fnc_sendReinfRadioResponse;
[_deniedRequests, false, _side]  call SQFM_fnc_sendReinfRadioResponse;

_assignedGroups;