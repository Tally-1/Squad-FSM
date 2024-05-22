private _camPos     = (positionCameraToWorld [0,0,0]);
private _objectives = _camPos nearEntities ["SQFSM_Objective", SQFM_maxObjRange];

{
	private _data = _x getVariable "SQFM_objectiveData";
	if(!isNil "_data")then{_data call["draw3D"]};
	
} forEach _objectives;