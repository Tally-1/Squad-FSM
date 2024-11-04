addMissionEventHandler ["PlayerConnected", {
	private _jip    = _this#3;
	private _client = _this#4;
	if(!_jip)exitWith{};
	[] remoteExec ["SQFM_fnc_onPlayerConnectedRemote", _client];
}];