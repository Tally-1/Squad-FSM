private _defCon = "_this isEqualTo _target";
params [
    ["_player",     nil, [objNull]], // The object to which the action will be attached 
    ["_title",      nil,      [""]], // Title shown on screen
    ["_code",       nil,      [{}]], // Code executed on action
    ["_condition", _defCon,   [""]], // Code (string)
    ["_icon",      "",        [""]], // procedural texture or URL to PAA
    ["_category",  "",        [""]]  // used in ACE only 
];

if(SQFM_ACE)exitWith{_this call SQFM_fnc_simpleSelfActionAce};

private _actionId = 
_player addAction [
    _title,     // title
    _code,      // Code executed on action
    nil,        // arguments
    0,          // priority
    false,      // showWindow
    true,       // hideOnUse
    "",         // shortcut
    _condition, // condition
    1,          // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];

_actionId;