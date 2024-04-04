params[
	["_type",nil,[""]]
];
if(_type isEqualTo "fob")  exitWith {"Forward Operating Base"};
if(_type isEqualTo "ammo") exitWith {"Ammo Storage"};
if(_type isEqualTo "hq")   exitWith {"Head Quarter"};

"unknown";