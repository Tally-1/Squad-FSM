params[
	["_timer", nil, [0]]
];
if((_self call ["boardingStatus"]) isEqualTo "boarded") exitWith{true;};
if(count(_self call ["getBoardingMen"])>0)              exitWith{true;};
if(time > _timer)                                       exitWith{true;};

false;