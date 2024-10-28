params[
    ["_man",nil,[objNull]]
];
private _eh = 
_man addEventHandler ["Fired",{
    params[
        ["_man",    nil,[objNull]],
        ["_weapon", nil,     [""]]
    ];
    private _launcher = secondaryWeapon _man;
    if(_weapon != _launcher)exitWith{};
    _man setVariable ["SQFM_forcedLauncher", true];
}];

_eh;