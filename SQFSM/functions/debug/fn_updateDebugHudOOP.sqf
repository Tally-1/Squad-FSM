#include "..\misc\textIncludes.sqf";
private _textBox      = _self get "textBox";
private _fps          = round diag_fps;
private _dedicated    = missionNamespace getVariable "SQFM_Dedicated";
if(isNil "_dedicated")exitWith{};

private _environment  = if(isMultiplayer)then{if(_dedicated)then{"Multiplayer (dedicated)"}else{"Multiplayer"}}else{"Singleplayer"};
private _population   = count allUnits;
private _hcCount      = count ((entities "HeadlessClient_F") select {_x in allPlayers});

if(isNil "_environment")           exitWith{};
if(_hcCount != SQFM_headlessCount) exitWith{
    SQFM_headlessCount = _hcCount;
    call SQFM_fnc_initDebugHUD;
};

if(_environment isEqualTo "Multiplayer")then{
    if(isServer)
    then{_environment = "Multiplayer (host)"}
    else{_environment = "Multiplayer (client)"};
};

private _envTxt        = [_left,"Environment:",_end,_right,_environment,_end]joinString"";
private _fpsTxt        = [_left,"FPS:",_end,_right,_fps,_end]joinString"";
private _populationTxt = [_left,"Population:",_end,_right,_population,_end]joinString"";
// private _ServerTxt     = [_left,"Is Server:",_end,_right,[isServer],_end]joinString"";
private _headLessTxt   = [_left,"Headless Clients:",_end,_right,_hcCount,_end]joinString"";

private _textArr = [
"<t size='0.95'>",
_envTxt,_newLine,
_fpsTxt,_newLine,
_populationTxt/*,_newLine,
_ServerTxt*/
];

if(_hcCount > 0)then{
    // _textArr set [0, "<t size='0.78'>"];
    _textArr append [_newLine, _headLessTxt];
};

private _text = _textArr joinString"";

_textBox call ["setText",[_text]];