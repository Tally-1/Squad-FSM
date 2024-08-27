private _spawners = camPos nearEntities ["SQFSM_TransportSpawner", 200];

{[_x] call SQFM_fnc_drawTransportModule} forEach _spawners;