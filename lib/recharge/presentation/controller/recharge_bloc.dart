import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/recharge/data/models/ExchangeModel.dart';
import 'package:ahlachat/recharge/data/models/RechargeModel.dart';
import 'package:ahlachat/recharge/domin/usecases/exchange_diamond_use_case.dart';
import 'package:ahlachat/recharge/domin/usecases/exchange_history_use_case.dart';
import 'package:ahlachat/recharge/domin/usecases/recharge_history_use_case.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recharge_event.dart';
part 'recharge_state.dart';

class RechargeBloc extends Bloc<RechargeEvent, RechargeState> {
  final ExchangeDiamondUseCase ExchangeDiamond;
  final RechargeHistoryUseCase RechargeHistory;
  final ExchangeHistoryUseCase ExchangeHistory;
  RechargeBloc(this.ExchangeDiamond,this.RechargeHistory,this.ExchangeHistory) : super(RechargeState()) {
    on<ChangeInputEvent>((event, emit) {

      emit(state.copyWith(

        InputValue: event.value,

      ));
      print(event.value);
    });
    on<ExchangeDiamondEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        ExchangeStatus:      RequestState.loading,
      ));
      final result= await  ExchangeDiamond.ExchangeDiamond(Diamond:state.InputValue );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          ExchangeStatus:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        myBloc.add(IncreaseMyCoins(Coins:((state.InputValue/100)*10).floor()));
        myBloc.add(DecreaseMyDiamond( Diamond:state.InputValue));


        emit(state.copyWith(
          ExchangeStatus:RequestState.loaded,

        ));



      }   );

    });
    on<SearchRecharge>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        RechargeHistoryStatus:      RequestState.loading,
      ));


      final result= await  RechargeHistory.RechargeHistory(history:state.SelectedDate??ConvertTimeToday(Time: DateTime.now().toLocal().toString() ));
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          RechargeHistoryStatus: RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');


        emit(state.copyWith(
          RechargeHistoryStatus: RequestState.loaded,
          RechargeHistory:r.data

        ));
        print(r.data?.length );



      }   );

    });
    on<SearchExchange>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        ExchangeHistoryStatus:         RequestState.loading,
      ));


      final result= await  ExchangeHistory.ExchangeHistory(history:state.SelectedDate??ConvertTimeToday(Time: DateTime.now().toLocal().toString() ));
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          ExchangeHistoryStatus: RequestState.error,

        ));

      }, (r){
        print(r.data);
print(r.Exchange);
        print('(r.Exchange(r.Exchange(r.Exchange(r.Exchange(r.Exchange');
        emit(state.copyWith(
            ExchangeHistoryStatus: RequestState.loaded,
            ExchangeHistory:r.Exchange

        ));
        print(r.Exchange?.length );



      }   );

    });


    on<SelectDateSearch>((event, emit)async{
      final DateTime? picked = await showDatePicker(
          context: NavigationService.CurrentContext,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != DateTime.now()) {
        emit(state.copyWith(
          SelectedDate:'${picked.year}-${picked.month}-${picked.day}'
        ));

print(state.SelectedDate);
      }

    });



  }
}
