addMissionEventHandler ["ProjectileCreated", {
	// params ["_projectile"];
	_this call SQFM_fnc_onProjectileCreated;
}];