private _canTransport = (_self call["canSelfTransport"]) 
                     or {_self call ["enoughTransportNear"]};

_canTransport;