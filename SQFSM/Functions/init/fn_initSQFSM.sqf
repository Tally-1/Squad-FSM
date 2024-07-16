isNil{// Forced unsheduled execution. Can run without, but this is faster.
dbgm    = SQFM_fnc_debugMessage;
dbgS    = SQFM_fnc_serverDebugMsg;
getData = SQFM_fnc_getData;

SQFM_manValue = 1;
SQFM_carValue = 3;
SQFM_ApcValue = 5;
SQFM_MbtValue = 9;

[]spawn{
	waitUntil { time>0;};
	isNil{
    if(hasInterface) then{[] call SQFM_fnc_clientInit;};
    if(isServer)     then{[] call SQFM_fnc_serverInit;};
}}};

true;