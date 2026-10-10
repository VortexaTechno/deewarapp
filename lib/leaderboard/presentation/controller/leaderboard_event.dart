part of 'leaderboard_bloc.dart';


@immutable
abstract class LeaderboardEvent  extends Equatable{
  const LeaderboardEvent();
}

class GetLeaderboardDayleEvent extends LeaderboardEvent {

  GetLeaderboardDayleEvent( );
  List<Object> get props => [ ];
}

class GetLeaderboardWeekEvent extends LeaderboardEvent {

  GetLeaderboardWeekEvent( );
  List<Object> get props => [ ];
}