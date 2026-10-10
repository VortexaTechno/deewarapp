part of 'user_profile_bloc.dart';




@immutable

class UserProfileState extends Equatable{
  final RequestState GetProfileState;
  final RequestState DeleteProfileImageState;
  final UserModel? Profile;
  UserProfileState({
this.DeleteProfileImageState=RequestState.loaded,
    this.GetProfileState=RequestState.loaded,
    this.Profile=null
  });
  UserProfileState copyWith({


    RequestState ? GetProfileState,
    RequestState ? DeleteProfileImageState,
    UserModel? Profile

  }) {
    return UserProfileState(
      GetProfileState:GetProfileState??this.GetProfileState,
    Profile: Profile??this.Profile,
      DeleteProfileImageState: DeleteProfileImageState??this.DeleteProfileImageState

    );
  }


  List<Object?> get props => [
    GetProfileState,
    Profile,
    DeleteProfileImageState
  ];
}


