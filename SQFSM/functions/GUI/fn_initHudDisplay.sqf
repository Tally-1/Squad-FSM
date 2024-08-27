disableSerialization;
params[
	["_varName",nil,[""]]
];
private _display = uiNameSpace getVariable [_varName,displayNull];
if(!isNull _display)
then{
	_display closeDisplay 1; 
	uiSleep 0.1;
};
("TAG_myLayer" call BIS_fnc_rscLayer) cutRsc [_varName,"PLAIN",-1,false,false];

waitUntil {!isNull (uiNameSpace getVariable _varName)};
_display = uiNameSpace getVariable _varName;

_display;