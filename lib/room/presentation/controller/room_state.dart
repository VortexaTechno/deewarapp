part of 'room_bloc.dart';

@immutable

class RoomState extends Equatable{
  final RequestState GetConstState;
  final RequestState GetRoomsState;
  final RequestState CheckRoomsState;
  final RequestState   CheckChairState;
  final RequestState  JoinVoiceRoomState;
  final RequestState FollowRoomsState;
  final RequestState LeaveVoiceRoomState;
  final RequestState ChangeImageState;
  final RequestState ChangeBlockState;

  final bool MemperPaginateState;

  final List<UserModel> JoindUsers;
  final List<UserModel> KickedUsers;

  final List<Sliderbanners> Banners;
  final List<Sliderbanners> BackBanners;
  final List<Category> RoomCategory;
  final List<RoomModel> Rooms;
  final bool JoinChairs;
  final RoomModel? CurrentRoom;
  RoomState({
    this.CheckChairState=RequestState.loaded,
    this.GetConstState=RequestState.loaded,
    this.GetRoomsState=RequestState.loaded,
    this.ChangeImageState=RequestState.loaded,
    this.CheckRoomsState=RequestState.loaded,
    this.JoinVoiceRoomState=RequestState.loaded,
    this.FollowRoomsState=RequestState.loaded,
    this.LeaveVoiceRoomState=RequestState.loaded,
    this.ChangeBlockState=RequestState.loaded,
    this.Banners=const [],
    this.RoomCategory=const [],
    this.BackBanners=const [],
    this.KickedUsers=const [],
    this.CurrentRoom=null,
    this.JoinChairs=false,
    this.MemperPaginateState=false,
    this.Rooms=const[],
    this.JoindUsers=const[],
} );

  RoomState copyWith({
    RequestState ? GetConstState,
    RequestState ? GetRoomsState,
    RequestState ?CheckRoomsState,
    RequestState ?JoinVoiceRoomState,
    RequestState ?CheckChairState,
    RequestState ?ChangeBlockState,



    RequestState ?LeaveVoiceRoomState,
    RequestState ?FollowRoomsState,
    RequestState ?ChangeImageState,

    List<Category>? RoomCategory,
    List<Sliderbanners>? Banners,
    List<UserModel>?JoindUsers,
    List<UserModel>?KickedUsers,
    List<Sliderbanners>? BackBanners,
    List<RoomModel>?  Rooms,
    RoomModel? CurrentRoom,
    bool ?JoinChairs,
    bool ? MemperPaginateState
  }) {
    return RoomState(
       GetConstState: GetConstState??this.GetConstState,
       Banners:  Banners??this.Banners,
       RoomCategory:  RoomCategory??this.RoomCategory,
       BackBanners:  BackBanners??this.BackBanners,
       FollowRoomsState: FollowRoomsState??this.FollowRoomsState,
         Rooms:  Rooms??this.Rooms,
        CheckChairState:CheckChairState??this.CheckChairState,
       ChangeImageState: LeaveVoiceRoomState??this.LeaveVoiceRoomState,
       GetRoomsState: GetRoomsState??this.GetRoomsState,
        CheckRoomsState: CheckRoomsState??this.CheckRoomsState,
      CurrentRoom: CurrentRoom??this.CurrentRoom,
     JoinVoiceRoomState: JoinVoiceRoomState??this.JoinVoiceRoomState,
      JoinChairs: JoinChairs??this.JoinChairs,
        JoindUsers: JoindUsers??this.JoindUsers,
      MemperPaginateState: MemperPaginateState??this.MemperPaginateState,
      KickedUsers: KickedUsers??this.KickedUsers,
      ChangeBlockState: ChangeBlockState??this.ChangeBlockState
    );
  }


  List<Object?> get props => [
    GetConstState,
    Banners,
    RoomCategory,
    BackBanners,
    Rooms,
    GetRoomsState,
    CheckRoomsState,
    CurrentRoom,
    JoinVoiceRoomState,
    JoinChairs,
    FollowRoomsState,
    LeaveVoiceRoomState,
    JoindUsers,
    MemperPaginateState,
    CheckChairState,
    KickedUsers,
    ChangeBlockState
  ];
}