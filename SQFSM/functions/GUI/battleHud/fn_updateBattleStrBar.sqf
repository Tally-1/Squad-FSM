params[
    ["_battle",nil,[createHashmap]]
];
private _strengthData = _battle get "strengthData";
if(isNil "_strengthData")exitWith{};
private _strengthBar = _display getVariable "SQFM_HUD"get"strengthBar";
[_strengthData, _strengthBar] call SQFM_fnc_setBattleHudStrengthBar;

true;