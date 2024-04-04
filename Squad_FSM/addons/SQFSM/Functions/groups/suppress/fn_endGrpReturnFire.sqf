private _self  = _this;
private _timer = time + 15;
sleep 5;
waitUntil {sleep 1; _self call ["isNotSuppressing",[_timer]]};

{_x suppressFor 10;} forEach (_self call ["getGrpMembers"]);
sleep 5;
waitUntil {sleep 1; _self call ["isNotSuppressing",[_timer]]};

[["Initial suppression ended ", round time]] call dbgm;

if(_self call ["inBattle"])
then{_self set["action", "Fighting"];}
else{_self set["action", ""];};

true;