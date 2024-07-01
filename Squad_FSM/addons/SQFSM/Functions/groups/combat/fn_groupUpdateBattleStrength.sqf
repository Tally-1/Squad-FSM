private _battle = _self call ["getBattle"];
if(isNil "_battle")exitWith{};

_battle call ["updateStrengthData"];
_battle call ["updateReforData"   ];
_battle call ["broadcastBattleHud"];

true;