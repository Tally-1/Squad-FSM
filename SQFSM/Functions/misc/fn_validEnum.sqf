params[
  ["_type", nil], 
  ["_allowedTypes", nil, [[]]],
  ["_function", nil, [""]]
];
private _invalidMsg = [
  "Invalid Enum, allowed types: ", (str _allowedTypes), " | Called from ", _function
]joinString"";

try   {if(isNil "_type")then{throw "string undefined, invalid Enum"}} 
catch {_exception call dbgm};

try   {if(isNil "_allowedTypes")then{throw "string undefined, invalid Enum"}} 
catch {_exception call dbgm};

try   {if!(_type in _allowedTypes)then{throw _invalidMsg}} 
catch {
  _exception call dbgm;
  [['Type used: "',_type,'"']] call dbgm;

};

true;