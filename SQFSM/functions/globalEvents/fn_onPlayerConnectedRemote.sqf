waitUntil { localNamespace getVariable["SQFSM_clientReady", false]};
waitUntil {isTouchingGround player};

[[name player, " connected JIP"]] call dbgs;

{
	private _side         = side group _x;
	private _hasTransport = _side in SQFM_transportSides;
	private _addTrAction  = _hasTransport 
		&&{[_x] call SQFM_fnc_isRealMan
		&&{[_x] call SQFM_fnc_canGetTransportAction}};

    if(_addTrAction)
    then{[_x] call SQFM_fnc_callTransportAction};
	
} forEach allUnits;