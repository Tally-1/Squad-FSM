params[
    ["_man",nil,[objNull]]
];
private _controller = remoteControlled _man;
private _controlled = (!isNull _controller)&&{_controller in allPlayers};
if(_controlled)exitWith{true};

private _owned = (_man getvariable ["bis_fnc_moduleRemoteControl_owner", ""])!="";
if(_owned)exitwith{true};

private _played = _man in allPlayers;
if(_played)exitWith{true};

false;