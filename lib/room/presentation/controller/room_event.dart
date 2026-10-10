part of 'room_bloc.dart';




@immutable
abstract class RoomEvent   extends Equatable {

  const RoomEvent();

}

class  GetRoomConst extends RoomEvent {

  GetRoomConst();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  GetRoomsevent extends RoomEvent {

  GetRoomsevent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  CheckRoomsevent extends RoomEvent {

  CheckRoomsevent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  AddRoomsevent extends RoomEvent {
  RoomModel value;
  AddRoomsevent({required this.value});
  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

class  JoinVoiceRoomEvent extends RoomEvent {
  int id;
  JoinVoiceRoomEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class  JoinVoiceRoomInRoomEvent extends RoomEvent {
  int id;
  JoinVoiceRoomInRoomEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class  JoinVoiceRoomDynamicLinkEvent extends RoomEvent {
  int id;
  JoinVoiceRoomDynamicLinkEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class EnterPasswordVoiceRoomEvent extends RoomEvent {
  int id;
  String?Password;
  EnterPasswordVoiceRoomEvent({required this.id,required this.Password});
  @override
  // TODO: implement props
  List<Object?> get props => [id,Password];
}


class FollowRoomsevent extends RoomEvent {

  FollowRoomsevent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class UnFollowRoomsevent extends RoomEvent {

  UnFollowRoomsevent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class InviteuserRoomEvent extends RoomEvent {
  int id;
  int Roomid;
  InviteuserRoomEvent({required this.id,required this.Roomid});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class ChangeRoomImageEvent extends RoomEvent {

  ChangeRoomImageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ChangeRoomBackGroundImageEvent extends RoomEvent {

  ChangeRoomBackGroundImageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeRoomnameEvent extends RoomEvent {
  String name;
  ChangeRoomnameEvent({required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ChangeRoomdescripeEvent extends RoomEvent {
  String name;
  ChangeRoomdescripeEvent({required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}




class ChangeImageEvent extends RoomEvent {
  String image;
  ChangeImageEvent({required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeBackImageEvent extends RoomEvent {
  String image;
  ChangeBackImageEvent({required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ChangenameEvent extends RoomEvent {
  String image;
  ChangenameEvent({required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ChangedescripEvent extends RoomEvent {
  String image;
  ChangedescripEvent({required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LeaveVoiceRoomEvent extends RoomEvent {
  String id;
  LeaveVoiceRoomEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetJoinMemberRoomEvent extends RoomEvent {

  GetJoinMemberRoomEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchMmeberRoomEvent extends RoomEvent {
  String tittle;
  SearchMmeberRoomEvent({required this.tittle});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class IncreaseCurrentRoomDonate extends RoomEvent {
  int Coins;
  IncreaseCurrentRoomDonate({required this.Coins});
  List<Object> get props => [Coins];
}

class ChangeChairEvent extends RoomEvent {
  int index;
  int status;
  ChangeChairEvent({required this.index,required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status,index];
}
class ChangemicEvent extends RoomEvent {
  int index;
  int status;
  ChangemicEvent({required this.index,required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status,index];
}

class AddUserToChairEvent extends RoomEvent {
  int index;
  UserModel user;
  AddUserToChairEvent({required this.index,required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user,index];
}
class RemoveUserToChairEvent extends RoomEvent {
  int index;
  UserModel user;
  RemoveUserToChairEvent({required this.index,required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user,index];
}


class RemoveUserFromRoomEvent extends RoomEvent {
  int id;

  RemoveUserFromRoomEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}




class KickUserFromRoomEvent extends RoomEvent {
  int id;

  KickUserFromRoomEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}




class KickUserEvent extends RoomEvent {
  int id;

  KickUserEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class UnKickUserEvent extends RoomEvent {
  int id;

  UnKickUserEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}


class GetKickedMemberRoomEvent extends RoomEvent {

  GetKickedMemberRoomEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}