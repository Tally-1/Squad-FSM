params [
    ["_entity",  nil, [objNull]]
];
private _group = group _entity;
if (isNull _group) exitWith{false};
if!(alive _entity) exitWith{false};

private _land  = _entity isKindOf "land";
private _air   = _entity isKindOf "air";
private _valid = _land or _air;
if!(_valid)exitWith{false};

private _unconscious = [_entity] call SQFM_fnc_unconscious;
if(_unconscious)exitWith{false};

private _player = _entity in allPlayers;
if(_player)exitWith{false};

private _side    = side _group;
private _correct = _side in [east,west,independent,civilian];
if!(_correct)exitWith{false};

true;