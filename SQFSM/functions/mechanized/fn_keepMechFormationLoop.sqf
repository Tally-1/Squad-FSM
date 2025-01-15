params[
    ["_leaderVehicle", nil,[objNull]],
    ["_group",         nil,[grpNull]]
];
private _ldrVeh      = vehicle formationLeader leader _group;
private _validLeader = _ldrVeh isEqualTo _leaderVehicle &&{[_leaderVehicle] call SQFM_fnc_validVehicle};

while {_validLeader} do {
        _ldrVeh      = vehicle formationLeader leader _group;
        _validLeader = _ldrVeh isEqualTo _leaderVehicle &&{[_leaderVehicle] call SQFM_fnc_validVehicle};

        private _data     = _group call getData;
        if(isNil "_data") exitWith{};
        
        _data call ["update"];

        private _wp         = _data call ["currentWaypoint"];
        private _driver     = driver _leaderVehicle;
        private _validVeh   = [_leaderVehicle] call SQFM_fnc_validVehicle;
        private _validGrp   = [_group] call SQFM_fnc_validGroup;
        private _radius     = _data call ["getRadius"];
        private _mechanized = _data call ["isMechanized"];
        private _men        = _data call ["getUnitsOnfoot"];
        private _movers     = count(_men select{!(_x getVariable ["FSM_moveEnded",true])});
        private _speedLimit = 6;

        if(_radius > 20)  then{_speedLimit  =  3};
        if(_radius < 8)   then{_speedLimit  = 10}; 
        if!(_mechanized)  exitWith{_data call ["endMechClearing"]};
        if!(_validGrp)    exitWith{_data call ["endMechClearing"]};
        if!(_validVeh)    exitWith{_data call ["endMechClearing"]};

        if(_radius > 65
        &&{_movers < 1
        &&{count _men > 0}})
        then{
                _wp = _data call ["currentWaypoint"];
                _driver disableAI "path";
                [_men] call SQFM_fnc_enforceFormation;
                _data call ["regroup",[false]];
                _driver enableAI "path";

                if(!isNil "_wp")
                then{_driver doMove (waypointPosition _wp)};
        };

        _leaderVehicle forceSpeed _speedLimit;

        _group setFormDir getDir _leaderVehicle;

        {
            _x setUnitPos "UP";
        } forEach units group _leaderVehicle;

        sleep 5;
};

true;