private _timer = time+5;
waitUntil { 
    private _transportVehicle = _self get "transportVehicle";
    private _validVehicle     = (!isNil "_transportVehicle")&&{alive _transportVehicle};

    if(time>_timer)   exitWith{true};
    if(_validVehicle) exitWith{true};
    false;
};

true;