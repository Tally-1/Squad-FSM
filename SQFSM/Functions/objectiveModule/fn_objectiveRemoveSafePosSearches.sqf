private _validSearches = (_self get "safePosSearches")select{
    private _searchTime = _x#0;
    private _timeSince  = time - _searchTime;
    private _valid      = _timeSince < SQFM_safePosLifeTime;

    _valid;
};

_self set ["safePosSearches", _validSearches];

true;