_self spawn{_self=_this;
private _display   = _self get "display";
private _objData   = _self get "objective";
private _imageBox  = _self get "imageBox";
private _mapImgBox = _self get "mapImgBox";
private _objPos    = _objData get "position";
private _size      = round((_objData get "zone")#1);
private _camZ      = if(_size > 200)then{200}else{_size};
private _camPos    = [_objPos#0,_objPos#1, 100];
private _camera    = "camera" camCreate _camPos;
private _camName   = ["cam_",str round 10,"_",str round time]joinString"";// name player;// str _position;
private _renderImg = ["#(argb,512,512,1)r2t(",_camName,",1)"]joinString"";
private _loadImg   = "#(argb,8,8,3)color(1,1,1,0.400000,ca)";
private _lowLight  = (getLighting#1)<200;
private _targetPos = ([_camPos#0,(_camPos#1)+1, 10]);
private _dummy     = "UserTexture1m_F" createVehicleLocal _targetPos;
private _timeLimit = time + 2;
private _goodFps   = diag_fps > 22;

_camera cameraEffect ["internal", "back", _camName];
_camera camSetTarget _dummy;
_camera camCommit 0;

_self set ["camera",   _camera];
_self set ["camTarget", _dummy];
_self set ["camTime",     time];

_imageBox call ["setImage",[_loadImg]];

// In order to avoid unnecesary lag the wait is only done when the FPS is over 22
if(_goodFps)
then{waitUntil {_self call["cameraReady",[_timeLimit]]}};

_imageBox call ["setImage",[_renderImg]];

if(!isNil "_mapImgBox")
then{_mapImgBox call ["setImage",[_renderImg]]};

if(_lowLight)
then{_camName setPiPEffect [8]};

true;
};