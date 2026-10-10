import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/leaderboard/data/models/leaderboardModel.dart';
import 'package:ahlachat/leaderboard/domin/usecases/get_daile_leaderboard_usecase.dart';
import 'package:ahlachat/leaderboard/domin/usecases/get_week_leaderboard_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final GetDaileleaderboardUseCase  Dayleleader;
  final GetweekleaderboardUseCase  Weelleader;

  LeaderboardBloc(this.Dayleleader,this.Weelleader) : super(LeaderboardState()) {
    on<GetLeaderboardDayleEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetRoomLeaderboardState:    RequestState.loading,
      ));
      final result= await  Dayleleader.GetDaileleaderboard();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetRoomLeaderboardState:RequestState.error,

        ));

      }, (r){


        emit(state.copyWith(
           DayleRoomLeaderboard: r.leaderboard,
          GetRoomLeaderboardState:RequestState.loaded,
          WeekRoomLeaderboard: []



        ));



      }   );

    });

    on<GetLeaderboardWeekEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetRoomLeaderboardState:    RequestState.loading,
      ));
      final result= await  Weelleader.GetWeekleaderboard();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetRoomLeaderboardState:RequestState.error,

        ));

      }, (r){


        emit(state.copyWith(
          WeekRoomLeaderboard:   r.leaderboard,
          GetRoomLeaderboardState:RequestState.loaded,



        ));



      }   );

    });
  }
}
