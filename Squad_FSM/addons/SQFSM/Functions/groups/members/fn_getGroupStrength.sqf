(_self call ["tallyAssets"])
params[
    ["_men",   nil, [0]], // Infantry
    ["_cars",  nil, [0]], // Armed Cars
    ["_apcs",  nil, [0]], // Light Armor 
    ["_tanks", nil, [0]]  // Heavy Armor
];

private _strength = 
(_men   * SQFM_manValue)+
(_cars  * SQFM_carValue)+
(_apcs  * SQFM_ApcValue)+
(_tanks * SQFM_MbtValue);


_strength;