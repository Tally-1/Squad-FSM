{
    if(camPos distance2D _x < 200)then{
        private _data3D = [_x] call SQFM_fnc_reforceModule3Ddata;
        drawIcon3D _data3D;
    };
    
    
} forEach (entities "SQFSM_Reforcer");

true;