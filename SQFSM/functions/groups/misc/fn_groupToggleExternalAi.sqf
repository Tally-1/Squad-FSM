params[
    ["_enable",nil,[true]]
];
private _group = _self get "grp";
private _men   = units _group;
_group setVariable ["lambs_danger_disableGroupAI", !_enable, true];
_group setVariable ["SFSM_Excluded",               !_enable, true];

{[_x, _enable]call SQFM_fnc_manToggleExternalAi} forEach _men;

true;