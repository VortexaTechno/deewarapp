part of 'user_profile_bloc.dart';

@immutable

abstract class UserProfileEvent   extends Equatable {
  const UserProfileEvent();
}


class  GetUserProfileEvent extends UserProfileEvent {
  final User;
  GetUserProfileEvent({this.User});
  @override
  // TODO: implement props
  List<Object?> get props => [User];
}

class  ChangeFollowStatusProfileEvent extends UserProfileEvent {
  final status;
  ChangeFollowStatusProfileEvent({this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class  GetUserProfileRoomEvent extends UserProfileEvent {
  final User;
  GetUserProfileRoomEvent({this.User});
  @override
  // TODO: implement props
  List<Object?> get props => [User];
}




class  DeleteImageUserProfileEvent extends UserProfileEvent {
  final id;
  DeleteImageUserProfileEvent({this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class  AddProfileImageEvent extends UserProfileEvent {

  AddProfileImageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

