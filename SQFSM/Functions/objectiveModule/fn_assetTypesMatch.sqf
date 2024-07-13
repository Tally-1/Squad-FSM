params[
	["_assetType",nil,[""]],
	["_groupType",nil,[""]]	
];
if(_assetType isEqualTo "infantry"
&&{"infantry" in _groupType})
exitWith{true;};

if(_assetType isEqualTo "cars"
&&{"light vehicle" in _groupType})
exitWith{true;};

if(_assetType isEqualTo "armor_l"
&&{"light armor" in _groupType})
exitWith{true;};

if(_assetType isEqualTo "armor_h"
&&{"heavy armor" in _groupType})
exitWith{true;};

false;