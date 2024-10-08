#include "..\..\misc\textIncludes.sqf";
private _textBox        = _self get "mainText";
private _objData        = _self get  "objective";
private _position       = _objData get "position";
private _owner          = toUpper str (_objData get "owner");
private _strength       = toUpper str (_objData get "assetStrength");
private _status         = _self call ["statusText"];
private _ownerText      = [_leftMediumSize, "Owned by: ", _end, _rightMediumSize, _owner, _end]joinString"";
private _minStrengthTxt = [_leftMediumSize, "Minimum Strength: ", _end, _rightMediumSize, _strength, _end]joinString"";
private _assignedAssets = _self call ["assetsText"];
private _locationName   = [_position]call SQFM_fnc_areaName;
private _location       = [_leftMediumSize, "Location: ", _end, _rightMediumSize, _locationName, _end]joinString"";
private _size           = round((_objData get "zone")#1);
private _sizeText       = [_leftMediumSize, "Size: ", _end, _rightMediumSize, _size, _end]joinString"";

private _text = [
    _location,       _newLine,
    _status,         _newLine,
    _ownerText,      _newLine,
    _minStrengthTxt, _newLine,
    _sizeText,       _newLine,
    _assignedAssets
] joinString "";

_textBox call ["setText",[_text]];