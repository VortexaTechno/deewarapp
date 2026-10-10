part of 'my_profile_bloc.dart';

@immutable

abstract class MyProfileEvent  extends Equatable {

  const MyProfileEvent();

}

class ChangeFollowedStatusEvent extends MyProfileEvent {
  final status;
  final index;
  ChangeFollowedStatusEvent({required this.status,required this.index});
  @override
  List<Object?> get props => [status,index];
}

class ChangeFrindsStatusEvent extends MyProfileEvent {
  final status;
  final index;
  ChangeFrindsStatusEvent({required this.status,required this.index});
  @override
  List<Object?> get props => [status,index];
}
class ChangeFollowerStatusEvent extends MyProfileEvent {
  final status;
  final index;
  ChangeFollowerStatusEvent({required this.status,required this.index});
  @override
  List<Object?> get props => [status,index];
}



class GetMyFriendsEvent extends MyProfileEvent {
  GetMyFriendsEvent();
  @override
  List<Object?> get props => [];
}
class GetLevelEvent extends MyProfileEvent {
  GetLevelEvent();
  @override
  List<Object?> get props => [];
}

class GetMyFriendsForItemEvent extends MyProfileEvent {
  GetMyFriendsForItemEvent();
  @override
  List<Object?> get props => [];
}

class GetMoreFriendsEvent extends MyProfileEvent {
  GetMoreFriendsEvent();
  @override
  List<Object?> get props => [];
}


class GetMyFollowedEvent extends MyProfileEvent {
  GetMyFollowedEvent();
  @override
  List<Object?> get props => [];
}


class GetFansEvent extends MyProfileEvent {
  GetFansEvent();
  @override
  List<Object?> get props => [];
}

class GetMedalEvent extends MyProfileEvent {
  GetMedalEvent();
  @override
  List<Object?> get props => [];
}

class SubmitFeedBackEvent extends MyProfileEvent {
  final descrbe;
  final contact;
  SubmitFeedBackEvent({this.descrbe,this.contact});
  @override
  List<Object?> get props => [descrbe,contact];
}


class ChangeProfileImageEvent extends MyProfileEvent {

  ChangeProfileImageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class UpdateProfileEvent extends MyProfileEvent {
  final name;
  final descript;
  final data;
  UpdateProfileEvent({this.name,this.descript,this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [name,descript,data];
}
