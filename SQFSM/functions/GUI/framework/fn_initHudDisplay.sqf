disableSerialization;
params[
	["_varName",     nil,     [""]],
    ["_showInMap",   false, [true]],
    ["_drawOverHUD", false, [true]]
];
private _display = uiNameSpace getVariable [_varName,displayNull];
if(!isNull _display)
then{
	_display closeDisplay 1; 
    waitUntil {uiSleep 0.05; (isNull (uiNameSpace getVariable [_varName,displayNull]))};
};

(_varName call BIS_fnc_rscLayer) cutRsc [_varName,"PLAIN",-1,_showInMap,_drawOverHUD];

waitUntil {!isNull (uiNameSpace getVariable _varName)};
_display = uiNameSpace getVariable _varName;

_display;