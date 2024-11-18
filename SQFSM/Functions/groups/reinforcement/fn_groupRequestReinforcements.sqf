_self call ["callReinforcementRadio"];
_self call ["addToReinfRequests"];

_self set ["lastReinfReq", round time];
_self call ["globalize"];
// _self spawn {
// 	sleep 1.1;
// 	_this call ["update"];
// };

true;