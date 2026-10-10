part of 'my_profile_bloc.dart';

@immutable


class MyProfileState extends Equatable {
  final RequestState GetFriendsState;
  final RequestState GetMedalState;
  final RequestState GetlevelState;
  final RequestState SubmitFeedBackState;
  final RequestState ChangeImageState;
  final RequestState UpdateProfileState;
  final List<LevelModel> wealth;
  final List<LevelModel> Income;

  final List<UserModel> Friends;
  final List<UserModel> Followed;
  final List<UserModel> Fans;
  final List<medalModel> Medal;
  final List<mymedalModel> MyMedal;
  const MyProfileState({
     this.Friends=const [],
     this.Followed=const [],
     this.wealth=const [],
     this.Income=const [],
     this.Fans=const [],
     this.Medal=const [],
     this.MyMedal=const [],
     this.GetFriendsState = RequestState.loaded,
     this.GetMedalState=RequestState.loaded,
    this.ChangeImageState=RequestState.loaded,
     this.GetlevelState=RequestState.loaded,
    this.SubmitFeedBackState=RequestState.loaded,
    this.UpdateProfileState=RequestState.loaded,

  });

  MyProfileState copyWith({
    RequestState? GetFriendsState,
    RequestState? GetMedalState,
    RequestState? GetlevelState,
    RequestState? SubmitFeedBackState,
    RequestState? UpdateProfileState,
    RequestState? ChangeImageState,
    List<UserModel>? Friends,
    List<UserModel>? Fans,
    List<UserModel>? Followed,
    List<medalModel> ? Medal,
    List<mymedalModel>?  MyMedal,

    List<LevelModel> ? wealth,
    List<LevelModel>?  Income,

  }) {
    return MyProfileState(
        Friends: Friends??this.Friends,
        GetFriendsState:GetFriendsState??this.GetFriendsState,
        Followed: Followed??this.Followed,
        SubmitFeedBackState:SubmitFeedBackState??this.SubmitFeedBackState,
        Fans: Fans??this.Fans,
        Medal: Medal??this.Medal,
        MyMedal: MyMedal??this.MyMedal,
        GetMedalState: GetMedalState??this.GetMedalState,
        GetlevelState: GetlevelState??this.GetlevelState,
        Income: Income??this.Income,
      wealth:  wealth??this.wealth,
       ChangeImageState: ChangeImageState??this.ChangeImageState,
      UpdateProfileState: UpdateProfileState??this.UpdateProfileState
    );
  }

  @override
  List<Object?> get props => [
    Friends,
    GetFriendsState,
    Followed,
    Fans,
    GetMedalState,
    Medal,
    Income,
    wealth,
    MyMedal,
    GetlevelState,
    SubmitFeedBackState,
    UpdateProfileState
  ];
}
