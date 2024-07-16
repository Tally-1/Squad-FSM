params[
	["_retry", nil, [true]]
];

private _hasTransport     = _self call    ["canSelfTransport"];
private _hasTransportNear = _self call ["enoughTransportNear"];
private _canTransport     = _hasTransport || _hasTransportNear;
private _boardingMehtod   = "boardOwnVehicles";

if!(_canTransport)exitWith{false;};
if!(_hasTransport)then{_boardingMehtod = "boardAllAvailable";};

_self set  ["action", "boarding"];
_self set  ["state", "boarding"];
_self call [_boardingMehtod];

private _boarded = _self call ["postBoarding"];

if(_boarded isEqualTo false
&&{_retry   isEqualTo true})
exitWith{
	"Retrying boarding" call dbgm;
	_self call ["boardVehicles", [false]];
};

_self set  ["action", ""];
_self set  ["state",  ""];


_boarded;