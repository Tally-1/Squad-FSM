{
	[_x, [
		"CuratorGroupSelectionChanged", 
		{_this remoteExec ["SQFM_fnc_onCuratorGroupSelection", (_this#0)]}
	]] remoteExec ["addEventHandler", 0, true];

} forEach allCurators;