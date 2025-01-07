#include "..\..\misc\textIncludes.sqf";
params[
    ["_east",nil,[0]],
    ["_guer",nil,[0]],
    ["_west",nil,[0]]
];
private _guerSide  = _center;
private _getStatus = {
    params[["_coef",nil,[0]]];
    if(_coef<40)exitWith{"Loosing"};
    if(_coef>60)exitWith{"Winning"};
    "Even force";
};

if!(_west>0)then{_guerSide = _left};
if!(_east>0)then{_guerSide = _right};

_east = round (_east*100);
_guer = round (_guer*100);
_west = round (_west*100);

private _westStrength = [_left,     _blue,  _west,"%",_endd] joinString"";
private _westStatus   = [_left,     _blue,([_west]call _getStatus),_endd]joinString"";
private _guerStrength = [_guerSide, _green, _guer,"%",_endd] joinString"";
private _guerStatus   = [_guerSide, _green,([_guer]call _getStatus),_endd]joinString"";
private _eastStrength = [_right,    _red,   _east,"%",_endd] joinString"";
private _eastStatus   = [_right,    _red,([_east]call _getStatus),_endd]joinString"";
private _textArr = [];

if(_west>0)then{_textArr pushBack _westStrength};
if(_guer>0)then{_textArr pushBack _guerStrength};
if(_east>0)then{_textArr pushBack _eastStrength};
_textArr pushBack _newLine;
if(_west>0)then{_textArr pushBack _westStatus};
if(_guer>0)then{_textArr pushBack _guerStatus};
if(_east>0)then{_textArr pushBack _eastStatus};


private _text = _textArr joinString "";
_self call ["setText",[_text]];

_text;