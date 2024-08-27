private _objectives = camPos nearEntities ["SQFSM_Objective", SQFM_maxObjRange];

{
	private _data = _x getVariable "SQFM_objectiveData";
	if(!isNil "_data")then{ 
		SQFM_curObj = _x;
		_data call["draw3D"];
	};
	
} forEach _objectives;

if(_objectives isEqualTo [])
then{SQFM_curObj = nil};

true;