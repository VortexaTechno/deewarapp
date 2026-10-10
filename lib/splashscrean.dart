
import 'dart:convert';

import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/splashscrean/presentaion/controller/splashscrean_bloc.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
class SplashScrean extends StatelessWidget {


  // void checkConnectitivy() async {
  //
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile||connectivityResult==ConnectivityResult.wifi) {
  //     SchedulerBinding.instance?.addPostFrameCallback((_) async{
  //       await   Helper().ids();
  //       Helper().checkVersion();
  //       Provider.of<LoginViewmodel>(context,listen: false).checklogin(context);
  //
  //
  //
  //
  //     });
  //   } else{
  //     Dialogs().showtoast('Internet is offline');
  //     SystemNavigator.pop();
  //
  //   }
  //
  //
  // }
  //
  // Future<bool> isRunningOnEmulator() async {
  //   try {
  //     // Get the device information.
  //     final deviceInfo = await DeviceInfoPlugin().androidInfo;
  //
  //     // Check if the device is an emulator/simulator.
  //     return deviceInfo.model!.toLowerCase().contains('sdk') ||
  //         deviceInfo.model!.toLowerCase().contains('emulator') ||
  //         deviceInfo.isPhysicalDevice == false;
  //   } on PlatformException {
  //     return true; // Assume emulator if checking fails.
  //   }
  // }
  // checklogin()async{
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Token=prefs.getString('token');
  //
  //   if(Token==null){
  //
  //     UserState.UpdateCurrentPage(Container(color: Colors.red,));
  //     // Navigator.pushNamed(context,AppConstants.Login_Screan);
  //   }else{
  //
  //
  //     var  datauser=  prefs.getString('UserData');
  //     var userinfo = jsonDecode(datauser!);
  //     var user = usermodel.fromJson(userinfo);
  //     UserState.MyUSERINFO(user);
  //     UserState.waitingConstDate(context);
  //
  //     UserId=user.id.toString();
  //     if(user.StarterBanner!=null){
  //
  //       UserState.UpdateCurrentPage(StartBannerScrean());
  //     }else{
  //
  //       UserState.UpdateCurrentPage(ButtomNavigation());
  //     }
  //
  //   }
  //
  // }
  // checkemulator()async{
  //   bool runningOnEmulator = await isRunningOnEmulator();
  //
  //   if (runningOnEmulator) {
  //     SystemNavigator.pop();
  //   }else{
  //
  //   }
  // }


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return  BlocProvider(
      create: (context) {
        return SplashscreanBloc()..add(CheckLoginState());
      },
      lazy: false,
      child: BlocBuilder<SplashscreanBloc, SplashScreanState>(
        builder: (contexts, state) {
          print(state);
          return state.CurrentScrean;
        },
      ),
    );

  }
}
