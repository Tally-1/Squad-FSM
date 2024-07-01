params[
    ["_x", nil, [0]],
    ["_y", nil, [0]],
    ["_w", nil, [0]], // width
    ["_h", nil, [0]]  // height
];
_x = _x * safezoneW + safezoneX;
_y = _y * safezoneH + safezoneY;
_w = _w * safezoneW;
_h = _h * safezoneH;

[_x,_y,_w,_h];