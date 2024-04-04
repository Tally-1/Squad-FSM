params[
	["_shooter",    nil, [objNull]],
	["_projectile", nil, [objNull]]
];
private _pos         = getPosASLVisual _projectile;
private _group       = _self get "grp";
private _shotList    = _self get "shots";
private _type        = typeOf _projectile;
private _shotDetails = [time, _pos, _shooter, _type];

_shotList pushBack _shotDetails;

if(count _shotList > 30)
then{_shotList deleteAt 0};

private _battlefield = _self call ["getBattle"];
if(isNil "_battlefield")exitWith{};

private _target      = getAttackTarget _shooter;
private _targetGrp   = group _target;
private _battleShots = _battlefield get "groupShots";
private _shotCount   = count _battleShots;
private _firstShot   = !(_battlefield get "shotsFired");//_shotCount isEqualTo 0;
private _shotDetails = [time, _pos, _group, _targetGrp, _type];

_battleShots pushBack _shotDetails;

if(_shotCount > 100)
then{_shotList deleteAt 0};

if(_firstShot)
then{_battlefield call ["onFirstShot", [_shooter, _projectile, _target]]};

true;