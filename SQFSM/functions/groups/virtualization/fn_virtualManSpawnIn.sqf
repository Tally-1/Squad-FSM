params[
    ["_group",nil,[grpNull]]
];
if(isNil "_group")
then{_group = createGroup (_self get "side")};

private _type    = _self get "type";
private _pos     = _self get "pos";
private _dir     = _self get "dir";
private _man     = _group createUnit [_type, _pos, [], 0, "NONE"];
private _rank    = _self get "rank";
private _loadOut = _self get "loadOut";


_man setUnitLoadout _loadOut;
_man setRank _rank;
_man setDir  _dir;

_self call ["getInVehicle",[_man]];

{_x addCuratorEditableObjects [[_man],true]} forEach allCurators;

_man;