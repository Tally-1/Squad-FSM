// use a value between 0-1
params[
    ["_west", 0, [0]],
    ["_east", 0, [0]],
    ["_guer", 0, [0]]
];

_self call ["setprogPos",[west, _west]];
_self call ["setprogPos",[independent, _guer]];
_self call ["setprogPos",[east, _east]];

true;