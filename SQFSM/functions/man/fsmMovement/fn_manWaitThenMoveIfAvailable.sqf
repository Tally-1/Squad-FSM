params [ 
    ["_man",       nil, [objNull]],       //  The man that will move.
    ["_waitTime",  nil,        []],      //   Max time to wait.
    ["_position",  nil,      [[]]],     //    Target position
    ["_time",      nil,       [0]],    //     Timeout (max time to attempt to reach said pos)
    ["_cRadius",   3,         [0]],   //      Completion radius (distance to wanted pos before move can be considered complete).
    ["_endCode",   nil,      [[]]],  //       Function to be run on completion [[params],{_code}]
    ["_condition", [],       [[]]], //        Boolean function, if it returns false the move will be aborted. [[params],{_code}]
    ["_cndFreq",   0.1,       [0]] //         How often the custom condition is checked 
];
private _available = [_man,_waitTime] call SQFM_fnc_manWaitUntilAvailable;
if(!_available)exitWith{
    [_man, "Move aborted, unit occupied"] spawn SQFM_fnc_flashActionMan;
    false;
};


_this deleteAt 1;
_this call SQFM_fnc_fsmMoveManToPos;

true;