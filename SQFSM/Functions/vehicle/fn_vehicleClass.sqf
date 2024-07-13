// This description is tailored for SQFSM, 
// for a more precise description use the DCO unitScanner.
params[
	["_class", nil, [0]]
];
if(_class isEqualTo 0.8)          exitwith {"static"};
if(_class>0.8  && {_class < 1.3}) exitwith {"light vehicle"};
if(_class>=1.3 && {_class < 2.6}) exitwith {"light armor"};
if(_class isEqualTo 2.6)          exitwith {"heavy armor"};
if(_class isEqualTo 6)            exitwith {"artillery"};

"unknown";