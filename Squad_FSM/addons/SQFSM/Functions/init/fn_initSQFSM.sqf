isNil{// Forced unsheduled execution. Can run without, but this is faster.
dbgm    = SQFM_fnc_debugMessage;
getData = SQFM_fnc_getData;

[]spawn{
	waitUntil { time>0;};
	isNil{
    if(hasInterface) then{[] call SQFM_fnc_clientInit;};
    if(isServer)     then{[] call SQFM_fnc_serverInit;};
}}};
true;