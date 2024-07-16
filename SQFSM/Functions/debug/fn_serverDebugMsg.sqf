// DebugMessage that is only shown on dedicated server.
if!(SQFM_Dedicated)exitWith{};
params[ 
	["_text",nil,["",[]]]
];
private _version   = missionNamespace getVariable ["SQFSM_Version", 999];
private _signature = ["[SQFSM-DEDICATED ",_version,"]: "]joinString"";

if (typeName _this  isEqualTo "STRING") then{_text = _this};
if (typeName _text  isEqualTo "ARRAY")  then{_text = _text joinString ""};
if!(typeName _text  isEqualTo "STRING") then{_text = str _text};

_text = [_signature, "{",_text,"}"]joinString"";

if(clientOwner isNotEqualTo 2)
then{_text = [_text," | (client ",clientOwner,")"]joinString"";};

[_text] remoteExecCall ["diag_log", 2];