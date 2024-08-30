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
		{_this spawn SQFM_fnc_onCuratorGroupDoubleClick}
	]] remoteExec ["addEventHandler", 0, true];

	[_x, [
		"CuratorObjectDoubleClicked", 
		{_this spawn SQFM_fnc_onCuratorObjectDoubleClicked}
	]] remoteExec ["addEventHandler", 0, true];

} forEach allCurators;
