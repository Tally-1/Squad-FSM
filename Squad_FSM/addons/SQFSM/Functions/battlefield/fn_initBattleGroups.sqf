{
	private _groupData = _x getVariable "SQFM_grpData";
	if  (!isNil "_groupData")
	then{
		_groupData call ["battleInit",[(_self get "position")]];
	};

} forEach (_self get "groups");

true;