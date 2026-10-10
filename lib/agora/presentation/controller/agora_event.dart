part of 'agora_bloc.dart';


@immutable
abstract class AgoraEvent   extends Equatable {

  const AgoraEvent();

}

class  initializeagoraEvent extends AgoraEvent {
  ClientRole? role;
  String Token;
  String channelName;
  initializeagoraEvent({required this.role,required this.Token,required this.channelName});
  @override
  // TODO: implement props
  List<Object?> get props => [role,Token,channelName];
}
class  SetAsBroadcasterEvent extends AgoraEvent {

  SetAsBroadcasterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class  SetasAudienceEvent extends AgoraEvent {

  SetasAudienceEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class  EndAgoraEvent extends AgoraEvent {

  EndAgoraEvent(  );
  @override
  // TODO: implement props
  List<Object?> get props => [ ];
}

class  initAgoraRtcEngineEvent extends AgoraEvent {
  ClientRole? role;

  initAgoraRtcEngineEvent({required this.role });
  @override
  // TODO: implement props
  List<Object?> get props => [role ];
}


class  addAgoraEventHandlersEvent extends AgoraEvent {
  addAgoraEventHandlersEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [ ];
}


class  OpenMicEvent extends AgoraEvent {
  OpenMicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ChangeSoundStausEvent extends AgoraEvent {
  int status;
  ChangeSoundStausEvent({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}


class CloseMicEvent extends AgoraEvent {
  CloseMicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}