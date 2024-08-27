{
	[_x, [
		"CuratorGroupSelectionChanged", 
		{_this remoteExec ["SQFM_fnc_onCuratorGroupSelection", (_this#0)]}
	]] remoteExec ["addEventHandler", 0, true];

	[_x, [
		"CuratorWaypointPlaced", 
		{_this remoteExec ["SQFM_fnc_onCuratorWaypoint", (_this#0)]}
	]] remoteExec ["addEventHandler", 0, true];

	[_x, [
		"CuratorGroupDoubleClicked", 
		{_this call SQFM_fnc_onCuratorGroupDoubleClick}
		// {_this remoteExecCall ["SQFM_fnc_onCuratorGroupDoubleClick", (_this#0)]}
	]] remoteExec ["addEventHandler", 0, true];

} forEach allCurators;
