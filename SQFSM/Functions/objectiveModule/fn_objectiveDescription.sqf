params[
	["_type",nil,[""]]
];
if(_type isEqualTo "hq")       exitWith {"Head Quarter"};
if(_type isEqualTo "dp")       exitWith {"Defensive Position"};
if(_type isEqualTo "op")       exitWith {"Observation Post"};
if(_type isEqualTo "fob")      exitWith {"Forward Operating Base"};
if(_type isEqualTo "town")     exitWith {"Town"};
if(_type isEqualTo "recon")    exitWith {"Recon"};
if(_type isEqualTo "supplies") exitWith {"Supply Point"};

"unknown";