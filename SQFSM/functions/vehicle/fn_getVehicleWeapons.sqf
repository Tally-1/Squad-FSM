params[
    ["_vehicle",nil,[objNull]]
];
private _nonLethal = ["SmokeLauncher", "CarHorn", "SportCarHorn"];
private _weapons   = (weapons _vehicle);

{_weapons insert [0, (_vehicle weaponsTurret _x), true]} 
forEach(allTurrets _vehicle);

private _lethal = _weapons select {!(_x in _nonLethal || {"Horn" in _x})};

_lethal;