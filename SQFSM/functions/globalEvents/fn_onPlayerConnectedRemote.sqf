waitUntil {localNamespace getVariable["SQFSM_clientReady", false]};
waitUntil {isTouchingGround player};

[[name player, " connected JIP"]] call dbgs;

{
	private _side         = side group _x;
	private _playable     = [_x] call SQFM_fnc_playableUnit;
	private _hasTransport = _side in SQFM_transportSides;
	private _addTrAction  = _hasTransport &&{_playable&&{[_x] call SQFM_fnc_isRealMan}};
	
	if(_addTrAction) then {[_x] call SQFM_fnc_callTransportAction};
	if(_playable)    then {
		[_x] call SQFM_fnc_playerRequestArtyAction;
		[_x] call SQFM_fnc_callReinforcementsAction;
	};
	
} forEach allUnits;