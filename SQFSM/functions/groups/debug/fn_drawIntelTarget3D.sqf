params[
    ["_iconPos",  nil,    [[]],3],
    ["_target",   nil, [objNull]],
    ["_prevCoef", nil,       [0]],
    ["_incCoef",  nil,       [0]]
];
private _icon      = "\a3\Modules_F_Curator\Data\iconCurator_ca.paa";
private _iconSize  = 1;
private _targetPos = ASLToATL aimPos _target;
private _finalCoef = _prevCoef+_incCoef;
private _prcnt     = round(_finalCoef*100);
private _incPrcnt  = round(_incCoef*100);
private _text      = ["Intel ",_prcnt,"% (+",_incPrcnt,"%)"]joinString"";
private _color     = [_finalCoef,0,1-_finalCoef,1];
private _white     = [1,1,1,1];

drawIcon3D[_icon,_color,_targetPos,_iconSize,_iconSize,0,"",2,0.03];
drawIcon3D["",_white,_targetPos,_iconSize,_iconSize,0,_text,2,0.04];
drawLine3D [_iconPos, _targetPos, _color];