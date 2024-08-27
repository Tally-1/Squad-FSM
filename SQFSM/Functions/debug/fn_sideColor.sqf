params [
	["_side",   nil,   [east]],
	["_marker", false, [true]]
];
if(_marker)exitWith{
	if(_side isEqualTo east)        exitWith{"ColorEAST"};
	if(_side isEqualTo west)        exitWith{"ColorWEST"};
	if(_side isEqualTo independent) exitWith{"ColorGUER"};
	
	"ColorWhite"
};

if(_side isEqualTo east)        exitWith{[0.5,0,0,1]};
if(_side isEqualTo west)        exitWith{[0,0.3,0.6,1]};
if(_side isEqualTo independent) exitWith{[0,0.5,0,1]};

[1,1,1,0.8];