import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class TermesAndCondition extends StatelessWidget {
  const TermesAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: Text.rich( TextSpan(
                children: [
                  TextSpan(
                    text:'By continuing you agree to the',style:TextStyle(color: Colors.black, fontSize:  SizeConfig.TenSize!*1.0,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {
               //       Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewScrean(name: getLang( context: context, key: "Terms_Service"), link: 'https://blush-clarinda-19.tiiny.site/',),));
                    },
                    text:  ' Terms Of Service ' ,style:TextStyle( fontSize: SizeConfig.TenSize! ,fontWeight: FontWeight.bold, decoration: TextDecoration.underline,  color:Colors.black),
                  ),
                  TextSpan(
                    text:  ' and ' ,style:TextStyle(color:Colors.black,fontSize: SizeConfig.TenSize!*1.0,fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {
                    //  Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewScrean(name: getLang( context: context, key: "Privacy_Policy"), link: 'https://salmon-celene-54.tiiny.site/',),));
                    },
                    text:  "Privacy Policy",style:TextStyle( decoration: TextDecoration.underline, fontSize: SizeConfig.TenSize!,fontWeight: FontWeight.bold, color:Colors.black),
                  ),


                ]),maxLines: null,textAlign: TextAlign.center,),
          ),



        ],
      ),
    );
  }
}
