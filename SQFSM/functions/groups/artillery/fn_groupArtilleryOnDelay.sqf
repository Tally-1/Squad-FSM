params[
    ["_artillery",nil,[objNull]]
];
private _group = group gunner _artillery;
_self set ["action", "Preparing to fire"];

_artillery setVariable ["SQFM_preparingArtyFire",true,true];
_artillery setVariable ["SQFM_preparingArtyTime",time,true];

sleep SQFM_artyDelay;

_artillery setVariable ["SQFM_preparingArtyFire",false,true];

_self set ["action", "FIRE!"];