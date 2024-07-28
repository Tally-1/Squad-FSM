params[
    ["_side",nil,["",east]]
];

if(typeName _side isEqualTo "SIDE")
then{_side = [_side] call SQFM_fnc_sideToStrSide};

private _groups     = _self get"assignedGroups"get(toLower _side);
private _men        = 0;
private _armedCars  = 0;
private _lightArmor = 0;
private _heavyArmor = 0;

{
    private _data = _x call getData;
    if((!isNil "_data")
    &&{_data call ["isValid"]})
    then{

        private _assetTally= _data call["tallyAssets"];

        _men        = _men+        (_assetTally#0);
        _armedCars  = _armedCars+  (_assetTally#1);
        _lightArmor = _lightArmor+ (_assetTally#2);
        _heavyArmor = _heavyArmor+ (_assetTally#3);
    
}} forEach _groups;

private _total = 
(_men        * SQFM_manValue)+
(_armedCars  * SQFM_carValue)+
(_lightArmor * SQFM_ApcValue)+
(_heavyArmor * SQFM_MbtValue);


private _assetMap = createHashmapObject 
[[
    ["infantry",  _men],
    ["cars",     _armedCars],
    ["armor_l",  _lightArmor],
    ["armor_h",  _heavyArmor],
    ["sum",      _total]
]];

_assetMap;