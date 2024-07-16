private _version   = missionNamespace getVariable ["SQFSM_Version", 999];
private _show      = missionNamespace getVariable ["SQFM_debugMode", true];
private _signature = ["[SQUAD FSM ",_version,"]: "]joinString"";
params[ 
	["_text",        nil,           ["",[]]],
	["_displayType", "systemChat",     [""]],
    ["_print",       _show, [true]],
    ["_log",         _show, [true]],
    ["_signature",   _signature,       [""]]
];

if (typeName _this  isEqualTo "STRING") then{_text = _this};
if (typeName _text  isEqualTo "ARRAY")  then{_text = _text joinString ""};
if!(typeName _text  isEqualTo "STRING") then{_text = str _text};

if(_log)then{diag_log ([_signature, _text] joinString "");};

if!(_print)exitWith{};

if!(isMultiplayer)exitWith{call compile ([_displayType, '"', _text,'";']joinString"")};

[
	_text, 
	_displayType,
	_signature,
	clientOwner
] remoteExecCall ["SQFM_fnc_sendDbgMsg", -clientOwner];

[_text] remoteExecCall [_displayType, clientOwner];

true;