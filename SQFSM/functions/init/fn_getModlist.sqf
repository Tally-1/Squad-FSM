private _list = getLoadedModsInfo select {!(_x#2 &&{_x#3})};
private _mods = _list apply {_x#1};

_mods;