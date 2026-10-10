part of 'pusher_bloc.dart';

@immutable
abstract class PusherEvent   extends Equatable {

  const PusherEvent();

}
class  StartUserSocketEvent extends PusherEvent {

  StartUserSocketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class  DisconnectUserSocketEvent extends PusherEvent {

  DisconnectUserSocketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class  StartGlopelSocketEvent extends PusherEvent {

  StartGlopelSocketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class  DisconnectGlopelSocketEvent extends PusherEvent {

  DisconnectGlopelSocketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class  StartRoomSocketEvent extends PusherEvent {
   StartRoomSocketEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  DisconnectRoomSocketEvent extends PusherEvent {
  int  id;
  DisconnectRoomSocketEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}