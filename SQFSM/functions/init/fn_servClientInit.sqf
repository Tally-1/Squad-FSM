waitUntil {time>0};

if(isServer)     then{[] call  SQFM_fnc_serverInit};
if(hasInterface) then{[] spawn SQFM_fnc_clientInit};