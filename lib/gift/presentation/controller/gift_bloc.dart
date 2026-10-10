import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/gift/data/models/GiftCategoryModel.dart';
import 'package:ahlachat/gift/data/models/GiftModel.dart';
import 'package:ahlachat/gift/domin/usecases/get_gifts_usecase.dart';
import 'package:ahlachat/gift/domin/usecases/send_gifts_usecase.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:meta/meta.dart';

part 'gift_event.dart';
part 'gift_state.dart';

class GiftBloc extends Bloc<GiftEvent, GiftState> {
  final GetGiftUseCase GetGif;
  final SendGiftUseCase SendGift;



  GiftBloc(this.GetGif,this.SendGift) : super(GiftState()) {
    on<GetGiftsEvent>((event, emit) async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetGiftsState: RequestState.loading,
      ));
      final result= await  GetGif.GetGifts();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetGiftsState:RequestState.error,

        ));

      }, (r){


        emit(state.copyWith(

          Gifts:   r.data ,
          GetGiftsState:RequestState.loaded,

        ));




      }   );
    });

    on<SendGiftEvent>((event, emit) async{
      final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);

      final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

      myBloc2.add( AddNewMessageToChatEvent(status: 2,user: myBloc.state.UserProfile!,reciver: state.SelectedUser,quant: state.SelectedNum,tittle:'Send Gift',Gift: state.SelectedGift));

    emit(state.copyWith(
      SendGiftsState: RequestState.loading,
    ));
    final result= await  SendGift.SentGift(Giftid: state.SelectedGift?.id, Quen:  state.SelectedNum, User_ID:  state.SelectedUser?.id);

    result.fold((l) {
    Showtoast(message: l.statusMessage??'');

    emit(state.copyWith(

      SendGiftsState:RequestState.error,

    ));

    }, (r){

      Showtoast(message: r.statusMessage??'');

      var coins=((int.parse(state.SelectedGift?.price??'0'))*int.parse(state.SelectedNum??'0')) ;



      myBloc.add(DecreaseMyCoins(Coins:coins));

    emit(state.copyWith(
    SelectedGift: null,
    SelectedNum: '1',
    SelectedUser: null,
    GetGiftsState:RequestState.loaded,

    ));




    }   );
    });

    on<SelectGiftEvent>((event, emit) async{

      emit(state.copyWith(
        SelectedGift:  event.Gift,
      ));


    });
    on<SelectUserEvent>((event, emit) async{

      emit(state.copyWith(
        SelectedUser:  event.User,
      ));


    });
    on<SelectNumEvent>((event, emit) async{

      emit(state.copyWith(
        SelectedNum:  event.Num,
      ));


    });



  }
}
