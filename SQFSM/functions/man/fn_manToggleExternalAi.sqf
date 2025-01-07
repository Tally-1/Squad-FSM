params[
    ["_man",    nil, [objNull]],
    ["_enable", nil,    [true]]
];
private _exclude = !_enable;
_man setVariable ["lambs_danger_disableAI",  _exclude, true];
_man setVariable ["SFSM_Excluded",           _exclude, true];
_man setVariable ["SQFM_externalAiExcluded", _exclude, true];

true;