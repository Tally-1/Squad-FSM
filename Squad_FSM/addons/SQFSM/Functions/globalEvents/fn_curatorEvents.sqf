{
	_x addEventHandler [
		"CuratorGroupSelectionChanged", 
		{_this remoteExec ["SQFM_fnc_onCuratorGroupSelection", (_this#0)]}
		];

} forEach allCurators;