params[
	["_man",nil,[objNull]]
];
private _data = (group _man) call getData;
if(isNil "_data")exitWith{};

_data call ["update"];

true;