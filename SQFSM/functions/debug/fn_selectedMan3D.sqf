if(!SQFM_curatorOn) exitWith{};

private _men = curatorSelected#0;
private _one = count _men isEqualTo 1;
if(!_one)exitWith{};

private _man = _men#0;
[_man] call SQFM_fnc_showDestinations3D;

true;