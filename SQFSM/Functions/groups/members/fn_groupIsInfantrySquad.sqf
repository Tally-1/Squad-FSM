if(_self call ["boardingStatus"] isEqualTo "on foot") exitWith{true;};
if(_self call ["isUnarmedMotorized"])                 exitWith{true;};

false;