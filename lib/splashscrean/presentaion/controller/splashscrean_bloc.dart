
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/presentation/Screans/room_screan.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/Screans/main_login_screan.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meta/meta.dart';

import '../../../mainpage/presentation/Screans/main_screan.dart';


part 'splashscrean_event.dart';
part 'splashscrean_state.dart';

class SplashscreanBloc extends Bloc<SplashScreanEvent, SplashScreanState> {
  SplashscreanBloc() : super(SplashScreanState(CurrentScrean: SizedBox())) {
    on<CheckLoginState>((event, emit) async{

      RequestPermissions();

      var  TokenChack=await GetSavedToken();
      print(TokenChack);

      if(TokenChack==null){
        emit(SplashScreanState(CurrentScrean: MainLoginScrean()));

      }else{
        MyToken=TokenChack;

        final info=await GetSavedUserData();

        final MyProfile = UserModel.fromJson(info);
         UserId=MyProfile.id.toString();
        final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
        final roombloc = BlocProvider.of<RoomBloc>(NavigationService.navigatorKey.currentContext!);

        myBloc.emit(UserloginState(UserProfile:MyProfile));
        myBloc.add(GetMyProfileEvent());

        roombloc.add(GetRoomConst());
        roombloc.add(GetRoomsevent());

         NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
        initDynamicLinks();
      }
      FlutterNativeSplash.remove();

    });

  }

}
