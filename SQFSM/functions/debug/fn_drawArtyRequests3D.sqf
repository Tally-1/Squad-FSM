if(!hasInterface)exitWith{};

{
    private _distance = camPos distance2D (_y#0);
    if(_distance < 400)
    then{_y call SQFM_fnc_artyRequest3D};
    
} forEach SQFM_activeArtyRequests;

true;