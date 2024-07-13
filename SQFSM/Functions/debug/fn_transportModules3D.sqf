private _camPos     = (positionCameraToWorld [0,0,0]);
private _spawners = _camPos nearEntities ["SQFSM_TransportSpawner", 200];

{[_x] call SQFM_fnc_drawTransportModule} forEach _spawners;