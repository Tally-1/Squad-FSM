private _valids = (_self get "squads_ingame")select{[_x] call SQFM_fnc_validGroup};
_self set ["squads_ingame",_valids];

_valids;