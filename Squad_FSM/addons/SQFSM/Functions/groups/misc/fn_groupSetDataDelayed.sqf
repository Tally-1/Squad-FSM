params[
    "_key",
    "_value", 
    ["_delay",0,[0]]
];
[_self, _key, _value, _delay]
spawn{params["_self","_key","_value", "_delay"];

sleep _delay;

_self set [_key, _value];

true;
};