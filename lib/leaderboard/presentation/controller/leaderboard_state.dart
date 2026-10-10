part of 'leaderboard_bloc.dart';

@immutable


class LeaderboardState extends Equatable {

  final RequestState GetRoomLeaderboardState;
  final List<leaderboardModel> DayleRoomLeaderboard;
  final List<leaderboardModel> WeekRoomLeaderboard;
  const LeaderboardState({
    this.GetRoomLeaderboardState= RequestState.loaded,
    this.DayleRoomLeaderboard=const [],
    this.WeekRoomLeaderboard=const [],


  });

LeaderboardState copyWith({
  RequestState ? GetRoomLeaderboardState,
  List<leaderboardModel>? WeekRoomLeaderboard,
  List<leaderboardModel>? DayleRoomLeaderboard,

  }) {
    return LeaderboardState(
      GetRoomLeaderboardState: GetRoomLeaderboardState??this.GetRoomLeaderboardState,
      DayleRoomLeaderboard: DayleRoomLeaderboard??this.DayleRoomLeaderboard,
      WeekRoomLeaderboard: WeekRoomLeaderboard??this.WeekRoomLeaderboard

    );
  }

  @override
  List<Object?> get props => [
    GetRoomLeaderboardState,
    DayleRoomLeaderboard,
    WeekRoomLeaderboard


  ];
}
