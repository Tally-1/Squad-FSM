params[ 
    ["_pos", nil, [[]]],
    ["_rad", nil,  [0]]
];
private _fipos     = _pos nearEntities ["SFSM_FIPO", _rad];
private _positions = _fipos apply {getPosATLVisual _x};

_positions;