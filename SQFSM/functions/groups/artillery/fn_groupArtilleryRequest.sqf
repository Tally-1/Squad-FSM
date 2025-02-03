params[
    ["_position",nil,[[]]]
];
private _canRequest = _self call ["canRequestArtillery",[false]];
if(!_canRequest)exitWith{
    "Artillery cannot be called by this group" call dbgm;
    false;
};

private _group = _self get "grp";
[_position, _group] call SQFM_fnc_addArtilleryRequest;
_self call ["radioRequestArtillery"];

// Recon arty calls does not register to battle-map
// in order to allow for more calls from recon squads.
private _isRecon = "recon" in [(_self get "groupType"),(_self get "squadClass")];
if(_isRecon)exitWith{true};

private _battlefield = _self call ["getBattle"];
if(isNil "_battlefield")exitWith{true};

private _side = side _group;
_battlefield call ["setArtyCallTime",[_side]];

true;