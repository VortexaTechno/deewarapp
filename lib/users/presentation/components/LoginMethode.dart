import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/users/presentation/Screans/login_phone_screan.dart';
import 'package:ahlachat/users/presentation/Screans/register_screan.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: SizeConfig.TenSize!*5),
      child: Column(
            children: [
              BlocBuilder<UserloginBloc, UserloginState>(
      builder: (context, state) {
        if(state.loginState==RequestState.loading){
          return SizedBox();

        }else{
          return LoginButton(image: 'assets/image/App/google.png',Texts: getLang( context: context, key: "Google_Sign_in"),onClickAction: (){
            print('Goolge Login');
            final myBloc = BlocProvider.of<UserloginBloc>(context);
            myBloc.add(FireBaseGoogleAuthEvent());
          });
        }

      },
),
                  SizedBox(height: 18),
                  LoginButton(image: 'assets/image/App/loginphone.png',Texts: getLang( context: context, key: "Phone_Sign_in"),onClickAction: (){
                    NavigateTo(context: context,screen: LoginPhoneScrean());
                  }),
                ],
              ));
  }

Widget  LoginButton({required String image,required String Texts, required Function onClickAction,}) {
return  InkWell(
  onTap:()=>onClickAction(),
  child:   Container(height: 52,
    width: double.infinity, // Set width to take full width of the screen
    decoration: BoxDecoration(  borderRadius: BorderRadius.circular(25) ,border: Border.all(width: 0.7,color: Colors.black.withOpacity(0.8))),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset(image),
    ),
    Text(Texts,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
    Opacity(opacity: 0.0,child: Image.asset(image)),
  ],
)
  ),
);

}
}
