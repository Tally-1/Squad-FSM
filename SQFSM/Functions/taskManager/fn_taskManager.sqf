private _tenSecondTimer = time + 10;
private _minuteTimer    = time + 60;
private _fiveMinTimer   = time + 300;

while {true}
do {
        private _startTime = time;
        
        if(time > _tenSecondTimer)
        then{
                _tenSecondTimer = time + 10;
                call SQFM_fnc_tenSecondTasks;
            };
        
        if(time > _minuteTimer)
        then{
                _minuteTimer    = time + 60;
                call SQFM_fnc_minuteTasks;
            };
        
        
        if(time > _fiveMinTimer)
        then{
                _fiveMinTimer   = time + 300;
                call SQFM_fnc_fiveMinTasks;
            };
        
        private _timeSpent = time - _startTime;
        private _sleep     = 1 - _timeSpent;

        if(_sleep > 0)then{sleep _sleep;};

};