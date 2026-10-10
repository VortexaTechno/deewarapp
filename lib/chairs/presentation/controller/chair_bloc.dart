
import 'dart:async';

import 'package:ahlachat/agora/presentation/controller/agora_bloc.dart';
import 'package:ahlachat/chairs/data/model/emojeModel.dart';
import 'package:ahlachat/chairs/domin/usecases/close_mic_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/get_emoje_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/join_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/leave_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/lock_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/open_mic_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/send_emoje_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/unlock_chair_usecase.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/gift/presentation/controller/gift_bloc.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/data/models/ChairModel.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

import '../../domin/usecases/leave_chair_admin_usecase.dart';

part 'chair_event.dart';
part 'chair_state.dart';


class ChairBloc extends Bloc<ChairEvent, ChairState> {

  final LockChairUseCase  LockChair;
  final UnLockChairUseCase UnLockChair;


  final LeaveChairUseCase LeaveChair;

  final LeaveChairAdminUseCase LeaveChairAdmin;

  final JoinChairUseCase JoinChair;
  final CloseMicUseCase  CloseMic;

  final GetEmojeUseCase  GetEmoje;
  final OpenMicUseCase OpenMic;
  final SendEmojeUseCase SendEmoje;
  ChairBloc(this.LockChair,this.UnLockChair,this.LeaveChairAdmin,this.GetEmoje,this.SendEmoje,this.LeaveChair,this.JoinChair,this.OpenMic,this.CloseMic) : super(ChairState()) {
    on<LockChairEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  LockChair.LockChair(id: event.id,index: event.index);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          ChangeChairStatus:    RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
          ChangeChairStatus: RequestState.loaded,
        ));

      }   );

    });

    on<UnLockLockChairEvent>((event, emit)async {
      ShowGlopalLoading();
      final result= await  UnLockChair.UnLockChair(id: event.id,index: event.index);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          ChangeChairStatus:    RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
          ChangeChairStatus: RequestState.loaded,
        ));

      }   );
    });


    on<JoinChairEvent>((event, emit) async{

      emit(state.copyWith(
        JoinChairStatus:    RequestState.loading,
      ));
      ShowGlopalLoading();
      final result= await  JoinChair.JoinChair(id: event.id,index: event.index);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          JoinChairStatus:    RequestState.error,
        ));
      }, (r){
        JoinChairId=event.id;
        print(JoinChairId);
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
          JoinChairStatus: RequestState.loaded,
        ));
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        myBloc.add(SetAsBroadcasterEvent());
        JoinChairStatus=true;
      }   );

    });
    on<LeaveChairEvent>((event, emit) async{
      emit(state.copyWith(
        JoinChairStatus:    RequestState.loading,
      ));
      ShowGlopalLoading();
      final result= await  LeaveChair.LeaveChair(id: event.id,index: event.index);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          JoinChairStatus:    RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
          JoinChairStatus: RequestState.loaded,
        ));
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        myBloc.add(SetasAudienceEvent());
          JoinChairStatus=false;
       JoinChairId=null;
      }   );

    });
    on<LeaveUserChairEvent>((event, emit) async{
      emit(state.copyWith(
        JoinChairStatus:    RequestState.loading,
      ));
      ShowGlopalLoading();
      final result= await  LeaveChairAdmin.LeaveChairAdmin(id: event.id,index: event.index);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          JoinChairStatus:    RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
          JoinChairStatus: RequestState.loaded,
        ));

      }   );

    });



    on<ChangeUserChairEvent>((event, emit) async{

      final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

      myBloc.add(SetasAudienceEvent());
      JoinChairStatus=false;
      JoinChairId=null;



    });



    on<OpenMicChairEvent>((event, emit) async{
      emit(state.copyWith(
        JoinChairStatus:    RequestState.loading,
      ));
      ShowGlopalLoading();
      final result= await  OpenMic.OpenMic();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

      }, (r){
        Showtoast(message: r.statusMessage??'');


        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        myBloc.add(SetAsBroadcasterEvent());
      }   );

    });
    on<CloseMicChairEvent>((event, emit) async{

      ShowGlopalLoading();
      final result= await  CloseMic.CloseMic();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

      }, (r){
        Showtoast(message: r.statusMessage??'');

        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        myBloc.add(SetasAudienceEvent());

      }   );

    });

    on<SendEmojeEvent>((event, emit) async{

      ShowGlopalLoading();
      final result= await  SendEmoje.SendEmoje(tittle: event.tittle);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

      }, (r){
        Showtoast(message: r.statusMessage??'');



      }   );

    });
    on<GetEmojeEvent>((event, emit) async{
      emit(state.copyWith(
        GetEmojeStatus:    RequestState.loading,
      ));
      ShowGlopalLoading();
      final result= await  GetEmoje.GetEmojes( );
      DismissGlopalLoading();
      result.fold((l) {

        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetEmojeStatus:    RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

       emit(state.copyWith(EmojeAsset: r.Emojes,  GetEmojeStatus:    RequestState.loaded,));



      }   );

    });
    on<CollectChairHostEvent>((event, emit) async{
      List<UserModel> Users=[];
      final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
 List<RoomChairs> Chairs=   myBloc.state.CurrentRoom?.roomChairs??[];
      Chairs.forEach((element) {
        if(element.user!=null){
          Users.add(element.user!);
        }
      });
      final myBloc2 = BlocProvider.of<GiftBloc>(NavigationService.CurrentContext);

      myBloc2.add(SelectNumEvent(Num: '1'));

      if(Users.isNotEmpty){

        myBloc2.add(SelectUserEvent(User: Users.first));
      }else{
        final myBloc3 = BlocProvider.of<UserloginBloc>(NavigationService.CurrentContext);

        myBloc2.add(SelectUserEvent(User:myBloc3.state.UserProfile!));
      }

      emit(state.copyWith(ChairhHosts: Users));
   print(state.ChairhHosts);
    });

  }

}
