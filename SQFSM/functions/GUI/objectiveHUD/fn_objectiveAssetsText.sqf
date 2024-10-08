private _size       = 2;
private _title      = [_newLine, _center,_largeTxt, "Assigned Assets:",_endd]joinString"";
private _manIcon    = ["\SQFSM_modules\icons\iconMan_ca.paa", _size] call SQFM_fnc_imgString;
private _carIcon    = ["\SQFSM_modules\icons\CAR.paa",        _size] call SQFM_fnc_imgString;
private _apcIcon    = ["\SQFSM_modules\icons\APC.paa",        _size] call SQFM_fnc_imgString;
private _tankIcon   = ["\SQFSM_modules\icons\TANK.paa",       _size] call SQFM_fnc_imgString;
private _assetList  = ["|",_manIcon,"|",_carIcon,"|",_apcIcon,"|",_tankIcon,"|",_right,"Strength",_end]joinString"";
private _westAssets = _self call ["assetStrength",[west]];
private _eastAssets = _self call ["assetStrength",[east]];
private _guerAssets = _self call ["assetStrength",[independent]];


private _text = [
    _title, _newLine,_newLine,
    _centerMediumSize, _assetList,_end,_newLine,
    _westAssets,_newLine,
    _eastAssets,_newLine,
    _guerAssets
    
] joinString "";

_text;