params[ 
	["_text",        nil,   [""]],
    ["_displayType", nil,   [""]],
	["_origin",      nil,   [""]]
];
if!(SQFM_debugMode)exitWith{};

if(_origin isNotEqualTo clientOwner
&&{_origin isEqualTo 2})
then{_text = _text insert [0, "(Server) SQFSM: "]};

diag_log _text;
[_text] remoteExecCall [_displayType, clientOwner];

true;