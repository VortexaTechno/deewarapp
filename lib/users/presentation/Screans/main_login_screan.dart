import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_string.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/presentation/components/LoginMethode.dart';
import 'package:ahlachat/users/presentation/components/TermesAndCondition.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
class MainLoginScrean extends StatelessWidget {
  const MainLoginScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async{
      return false;
    },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: SizeConfig.screenHeight,
          width:SizeConfig.screenWidth,
          child: Stack(
            children: [
              Image.asset(Images.LoginBackground),
              SVGASimpleImage(assetsName:Images.LoginEffect,),
              Container(
            color: Colors.transparent,
            height: SizeConfig.screenHeight,
            width:SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Spacer(),
                Row(         mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 65,width: 63,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: ExactAssetImage('assets/image/App/KokyLogo.jpeg'),fit: BoxFit.cover)) ),
                    SizedBox(width: 10,),
                    Text(AppString.appName,style: TextStyle(fontSize: 40,fontFamily: "numbers",color: MainColor,fontWeight: FontWeight.bold),),
                  ],
                ),

                Image.asset(Images.Rocket),
                const SizedBox(height: 20,),
                LoginMethod(),
                Spacer(),

                TermesAndCondition(),

              ],
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
