params[
    ["_side",  nil, [west]],
    ["_text",  nil,   [""]],
    ["_delay", 0,      [0]]
];
sleep _delay;
[[_side, "base"], _text] remoteExecCall ["sideChat"];

true;