params[
    ["_rounds",   nil,[0]],
    ["_maxCount", nil,[0]]
];
if(_rounds > _maxCount)then{
    "Not enough rounds to complete fire mission" call dbgm;
    [["Artillery will fire ", _maxCount, " shells at target position"]] call dbgm;
    _rounds = _maxCount;
};

_rounds;