params[
    ["_man",nil,[objNull]]
];
private _actionText = "<t color='#f13333'>End Direct Control</t>";
private _addActionID = _man addAction [
    _actionText, 
    {
        params["_man", "_man", "_id"];
        disableSerialization;
        _man removeAction _id;
        call SQFM_fnc_endDirectControl;
    }, 
    nil, 
    6, 
    false,
    false,
    "curatorInterface",
    "_target isEqualTo _this;"
];

_addActionID;