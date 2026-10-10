import 'package:ahlachat/Localization/localize_bloc.dart';
import 'package:ahlachat/agora/presentation/controller/agora_bloc.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/Router.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/gift/presentation/controller/gift_bloc.dart';
import 'package:ahlachat/leaderboard/presentation/controller/leaderboard_bloc.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/svga/data/ViewModel/show_entry_view_model.dart';
import 'package:ahlachat/svga/data/ViewModel/show_gift_view_model.dart';
import 'package:ahlachat/svga/presentation/controller/svga_bloc.dart';
import 'package:ahlachat/vip/presentation/controller/vip_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'chairs/data/ViewModel/emoje_view_model.dart';
import 'mainpage/presentation/controller/main_screan_bloc.dart';


import 'pusher/presentation/controller/pusher_bloc.dart';
import 'recharge/presentation/controller/recharge_bloc.dart';
import 'room/presentation/controller/room_bloc.dart';
import 'userprofile/presentation/controller/user_profile_bloc.dart';
import 'users/presentation/controller/userlogin_bloc.dart';
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  static BuildContext CurrentContext=navigatorKey.currentContext!;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  ///await PurchasaApi.init();
  await Firebase.initializeApp();
  ServicesLocator().init();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    WakelockPlus.enable();
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizeBloc>(
          create: (BuildContext context) => LocalizeBloc()..add(startlanguageevent()),
        ),
        BlocProvider<MainScreanBloc>(
          create: (BuildContext context) => MainScreanBloc(),
        ),
        BlocProvider<MyProfileBloc>(
          create: (BuildContext context) => sl<MyProfileBloc>(),
        ),
        BlocProvider<UserloginBloc>(
          create: (BuildContext context) => sl<UserloginBloc>(),
        ),
        BlocProvider<ShopBloc>(
          create: (BuildContext context) => sl<ShopBloc>(),
        ),
        BlocProvider<VipBloc>(
          create: (BuildContext context) => sl<VipBloc>(),
        ),
        BlocProvider<RechargeBloc>(
          create: (BuildContext context) => sl<RechargeBloc>(),
        ),
        BlocProvider<UserProfileBloc>(
          create: (BuildContext context) => sl<UserProfileBloc>(),
        ),
        BlocProvider<RoomBloc>(
          create: (BuildContext context) => sl<RoomBloc>(),
        ),
        BlocProvider<AgoraBloc>(
          create: (BuildContext context) => sl<AgoraBloc>(),
        ),
        BlocProvider<PusherBloc>(
          create: (BuildContext context) => sl<PusherBloc>(),
        ),
        BlocProvider<ChairBloc>(
          create: (BuildContext context) => sl<ChairBloc>(),
        ),
        BlocProvider<RoomchatBloc>(
          create: (BuildContext context) => sl<RoomchatBloc>(),
        ),
        BlocProvider<SvgaBloc>(
          create: (BuildContext context) => sl<SvgaBloc>(),
        ),
        BlocProvider<GiftBloc>(
          create: (BuildContext context) => sl<GiftBloc>(),
        ),
        BlocProvider<LeaderboardBloc>(
          create: (BuildContext context) => sl<LeaderboardBloc>(),
        ),


      ],

      child: BlocBuilder<LocalizeBloc, LocalizeState>(
        builder: (context, state) {
          return MultiProvider(

            providers: [
              ChangeNotifierProvider(create: (context)=>EmojeViewmodel()),
              ChangeNotifierProvider(create: (context)=>ShowEntryViewmodel()),

              ChangeNotifierProvider(create: (context)=>ShowGiftViewmodel()),

            ],
            child: MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Tajawal',
                primaryColor: const Color(0xFF2060C0),
                colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2060C0)),
              ),
              title:AppConstance.app_name,
              navigatorKey: NavigationService.navigatorKey, // set property
              restorationScopeId: "root",
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
              onGenerateRoute: generateRoute,
              initialRoute: RouteConstance.splash_screan,
              locale: state.localize,
              supportedLocales: [
                const Locale('en', ''),
                const Locale('ar', ''),
                const Locale('es', ''),
                const Locale('tr', ''),
                const Locale('it', ''),
              ],
              localizationsDelegates: const [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // home: FludoGame(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
