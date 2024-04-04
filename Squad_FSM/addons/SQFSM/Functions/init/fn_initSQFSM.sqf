[]spawn{
	waitUntil { time>0;};
	isNil{
    dbgm    = SQFM_fnc_debugMessage;
    getData = SQFM_fnc_getData;

    if(hasInterface) then{[] call SQFM_fnc_clientInit;};
    if(isServer)     then{[] call SQFM_fnc_serverInit;};
}};
true;