params[
	["_success", nil, [true]]
];
if(_success isEqualTo false)then{sleep 5;};

if(count(_self call ["getBoardingMen"])>0
&&{_success isEqualTo false})
then{
	private _timer = time+30;
	private _action = _self get "action";

	waitUntil {
		sleep 1; 
		private _remaining = count(_self call["getBoardingMen"]);
		private _txt = [_remaining, " Men still boarding | ", round (_timer-time), " seconds left"]joinString"";
		_self set ["action", _txt];
		_remaining isEqualTo 0 || {_timer > time};
	};
	_self set  ["action", _action];
	_success = _self call ["boardingStatus"] isEqualTo "boarded";
};


_success;