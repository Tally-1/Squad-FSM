isNil{// Forced unsheduled execution. Can run without, but this is faster.
private _addons = call SQFM_fnc_loadedAddons;

dbgm    = SQFM_fnc_debugMessage;
dbgS    = SQFM_fnc_serverDebugMsg;
getData = SQFM_fnc_getData;

SQFM_maxRpgRange           = 500;
SQFM_atSupportCallCooldown = 300;
SQFM_manValue              = 1;
SQFM_carValue              = 3;
SQFM_ApcValue              = 5;
SQFM_MbtValue              = 9;
SQFM_clickDc               = false;
SQFM_highCommandOn         = false;
SQFM_ZEH                   = "@Zeus Enhanced" in _addons;
SQFM_SFSM                  = "@soldierFSM" in _addons && {(!isNil "SFSM_disableSoldierFSM") && {SFSM_disableSoldierFSM isEqualTo false}};
SQFM_addonCount            = count _addons;
SQFM_headlessCount         = count ((entities "HeadlessClient_F") select {_x in allPlayers});
SQFM_validMods     = [
  "@Zeus Enhanced",
  "@soldierFSM",
  "@soldierFSMModule",
  "@Squad_FSM",
  "@SQFSM_Modules",
  "@{ALPHA} DCO Squad FSM",
  "@ace",
  "@DCO UnitScanner",
  "@CBA_A3"
];

[]spawn{
	waitUntil { time>0;};
	isNil{
    if(hasInterface) then{[] call SQFM_fnc_clientInit;};
    if(isServer)     then{[] call SQFM_fnc_serverInit;};
}}};

true;