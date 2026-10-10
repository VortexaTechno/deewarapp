import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:ahlachat/vip/data/models/VipSalesModel.dart';
import 'package:ahlachat/vip/domin/usecases/buy_vip_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/get_vip_shop_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/remove_vip_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/use_vip_use_case.dart';
import 'package:ahlachat/vip/presentation/Screans/vip_shop_screan.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'vip_event.dart';
part 'vip_state.dart';

class VipBloc extends Bloc<VipEvent, VipState> {
  final GetVipShopUseCase GetVipShop;
  final BuyVipUseCase BuyVip;
  final UseVipUseCase UseVip;
  final RemoveVipUseCase RemoveVip;
  VipBloc(this.GetVipShop,this.BuyVip,this.UseVip,this.RemoveVip) : super(VipState()) {

    on<GetVipShopEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetVipShopState:  RequestState.loading,
      ));
      final result= await  GetVipShop.GetVipShopItem();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetVipShopState:RequestState.error,

        ));

      }, (r){


        emit(state.copyWith(
          VipSales:r.Sales,
          VipShopPackages:  r.Vip ,
          GetVipShopState:RequestState.loaded,

        ));


         NavigateTo(context: NavigationService.CurrentContext, screen: VipShopScrean());
      }   );

    });


    on<BuyVipEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        ByeVipState:   RequestState.loading,
      ));
      final result= await  BuyVip.BuyVipItem(id:  event.vip.id);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          ByeVipState:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        myBloc.add(DecreaseMyCoins(Coins: event.vip.price??0));
     List<VipSalesModel> sales=state.VipSales;
        sales.add(VipSalesModel(status: 0,vipId: event.vip.id,vip: event.vip,days:event.vip.days,deleted: 0 ,createdAt: DateTime.now().toString() ));
        emit(state.copyWith(
          ByeVipState:RequestState.loaded,
          VipSales:sales
        ));



      }   );

    });
    on<UseVipEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        UseVipStatus:    RequestState.loading,
      ));
      final result= await  UseVip.UseVip(id:  event.Sales.id);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          UseVipStatus:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        List<VipSalesModel> sales=state.VipSales;
        sales.forEach((element) {element.status=0;});
        sales.where((element) => element.id==event.Sales.id).first.status=1;

        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        myBloc.add(UpdateMyvip(sales:event.Sales,));
         emit(state.copyWith(
            UseVipStatus:RequestState.loaded,
        ));



      }   );

    });
    on<RemoveVipEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        RemoveVipStatus:    RequestState.loading,
      ));
      final result= await  RemoveVip.RemoveVip(id:  event.Sales.id);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          RemoveVipStatus:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        List<VipSalesModel> sales=state.VipSales;
        sales.where((element) => element.id==event.Sales.id).first.status=0;
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        myBloc.add(UpdateMyvip(sales:0,));
        emit(state.copyWith(
          RemoveVipStatus:RequestState.loaded,
        ));



      }   );

    });

  }
}
