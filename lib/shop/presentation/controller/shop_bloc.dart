import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/shop/data/models/ItemModel.dart';
import 'package:ahlachat/shop/data/models/PackageModel.dart';
import 'package:ahlachat/shop/data/models/SalesModel.dart';
import 'package:ahlachat/shop/data/models/SalesPackageModel.dart';
import 'package:ahlachat/shop/domin/usecases/buy_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/get_mine_item_usecae.dart';
import 'package:ahlachat/shop/domin/usecases/get_shop_package_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/send_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/un_wear_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/wear_item_usecase.dart';
import 'package:ahlachat/shop/presentation/Screans/mine_item_screan.dart';
import 'package:ahlachat/shop/presentation/Screans/shop_screan.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../profile/presentation/controller/my_profile_bloc.dart';



part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetShopPackageUseCase GetShopPackage;
  final BuyItemUseCase BuyItem;
  final SendItemUseCase SendItem;
  final GetMineItemUseCase MineItem;
  final WearItemUseCase   WearItem;
  final UnWearItemUseCase   UnWearItem;
  ShopBloc(this.GetShopPackage,this.BuyItem,this.SendItem,this.MineItem,this.WearItem,this.UnWearItem) : super(ShopState()) {
    on<GetShopPackageEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetShopState:RequestState.loading,
      ));
      final result= await  GetShopPackage.GetPackage();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

        GetShopState:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          ShopPackages:  r.package ,
          GetShopState:RequestState.loaded,

        ));


        NavigateTo(context: NavigationService.CurrentContext, screen: ShopScrean());

      }   );

    });
    on<GetMinePackageEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetMineState:  RequestState.loading,
      ));
      final result= await  MineItem.GetMineItem();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetMineState:RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          MinePackages:   r.package ,
          GetMineState:RequestState.loaded,

        ));


        NavigateTo(context: NavigationService.CurrentContext, screen: MineScrean());

      }   );

    });
    on<SelectItemEvent>((event, emit)async{

if(event.Item.kind==0){
  showDialog(
      barrierColor: Colors.black12,
      context: NavigationService.CurrentContext,
      builder: (_) => new Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
        child: Container(height: SizeConfig.screenHeight,width: SizeConfig.screenWidth,child: SVGASimpleImage(resUrl:event.Item.svga ),
      ))).then((value) => StopSoundUrl());
  PlaySoundUrl(url:event.Item.sound);
}

  emit(state.copyWith(
    SelectedItem: event.Item ,
  ));

print(state.SelectedItem?.svga);

    });
    on<ByeItemEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        BuyItemState: RequestState.loading,
      ));
      final result= await  BuyItem.BuyItem(ItemId:state.SelectedItem?.id??0 );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          BuyItemState: RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          BuyItemState:RequestState.loaded,
        ));
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
         myBloc.add(DecreaseMyCoins(Coins: state.SelectedItem?.price??0));



      }   );


    });

    on<SendItemEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        BuyItemState: RequestState.loading,
      ));
      final result= await  SendItem.SendItem(ItemId:state.SelectedItem?.id??0,Userid: event.id );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          BuyItemState: RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          BuyItemState:RequestState.loaded,
        ));
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        myBloc.add(DecreaseMyCoins(Coins: state.SelectedItem?.price??0));



      }   );


    });
    on<WearItemEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        WearMineState: RequestState.loading,
      ));
      final result= await  WearItem.WearItem(SalesId: event.sales.id??0);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          WearMineState: RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);

        if(event.sales.kind==0){
           myBloc.add(UpdateMyEntryEvent( Entry:  event.sales));
        }else{
          myBloc.add(UpdateMyFrameEvent( Frame: event.sales));
        }

        emit(state.copyWith(
          WearMineState:RequestState.loaded,
        ));


      }   );


    });

    on<UnWearItemEvent>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        WearMineState: RequestState.loading,
      ));
      final result= await  UnWearItem.UnWearItem(SalesId: event.sales.id??0);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          WearMineState: RequestState.error,

        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);

        if(event.sales.kind==0){
          myBloc.add(RemoveMyEntryEvent());
        }else{
          myBloc.add(RemoveMyFrameEvent());
        }
print('asdddddddddddddddddddddddddddd');
        emit(state.copyWith(
          WearMineState:RequestState.loaded,
        ));


      }   );


    });
  }
}
