params[
    ["_img",  nil,[""]],
    ["_size",   3, [0]]
];
private _string = ["<t size='",_size,"'>", "<img image='",_img,"'></img>","</t>"]joinString "";

_string;