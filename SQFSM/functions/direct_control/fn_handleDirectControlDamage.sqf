params[
	["_man",nil,[objNull]]
];
private _eh_id = _man addEventHandler ["HandleDamage",
{
    params ["_man", "_selection", "_handler"];
    
    if (_handler >= 0.999) then
    {
        if (_selection in ["","body","head"]) 
        then{[true] call SQFM_fnc_switchUnit_exit};

        _handler = 0.999;
    };

    _handler;
}];

_eh_id;