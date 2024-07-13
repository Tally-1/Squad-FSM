private _v         = SQFSM_Version;
private _signature = ["[SQUAD FSM ",_v,"]: "]joinString"";
params[ 
	["_text",        nil,           ["",[]]],
	["_displayType", "systemChat",     [""]],
    ["_print",       SQFM_debugMode, [true]],
    ["_log",         SQFM_debugMode, [true]],
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