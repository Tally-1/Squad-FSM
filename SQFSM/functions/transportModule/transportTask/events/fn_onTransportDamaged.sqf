/*
this disables crash-damage to wheels, engine and fuel tanks for transport vehicles.
*/
params [
    ["_vehicle",    nil, [objNull]],
    ["_selection",  nil,      [""]],
    ["_damage",     nil,       [0]],
    ["_source",     nil, [objNull]],
    ["_projectile", nil,      [""]],
    ["_hitIndex",   nil,      [""]],
    ["_instigator", nil, [objNull]],
    ["_hitPoint",   nil,      [""]]
];
if(!isNull _source)             exitWith{};
if(_projectile isNotEqualTo "") exitWith{};

{
    private _important = ("wheel" in _x) or{("engine" in _x) or {"fuel" in _x}};
    if(_important)then{
        _vehicle setHitPointDamage [_x, 0];
    };
    
} forEach ((getAllHitPointsDamage _vehicle)#0);