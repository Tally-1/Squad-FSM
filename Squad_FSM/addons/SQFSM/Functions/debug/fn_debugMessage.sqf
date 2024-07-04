private _print       = SQFM_debugMode;
private _log         = SQFM_debugMode;
private _displayType = "systemChat";
private _v           = SQFSM_Version;
private _signature   = ["[SQUAD FSM ",_v,"]: "]joinString"";

params[ 
	"_text",
	"_displayType",
    "_print", 
    "_log",
    "_signature"
];

if (typeName _this  isEqualTo "STRING") then {_text = _this};
if (typeName _text  isEqualTo "ARRAY")  then {_text = _text joinString ""};
if!(typeName _text isEqualTo "STRING")  then {_text = str _text};


if(_log)then{diag_log ([_signature, _text] joinString "");};

if!(_print)exitWith{};

[
	_text, 
	_displayType,
	_signature,
	clientOwner
] remoteExecCall ["SQFM_fnc_sendDbgMsg", -clientOwner];

[_text] remoteExecCall [_displayType, clientOwner];

true;