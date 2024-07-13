params[
    ["_dir",   nil,     [0]],
    ["_round", false, [true]]
];

if!(_round)exitWith{((_dir + 360) % 360);};
_dir = round((_dir + 360) % 360);

_dir;