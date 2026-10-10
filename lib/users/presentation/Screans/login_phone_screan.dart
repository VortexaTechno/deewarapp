import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/core/utils/validation.dart';
import 'package:ahlachat/users/presentation/Screans/enter_code_login_screan.dart';
import 'package:ahlachat/users/presentation/Screans/forget_password_screan.dart';
import 'package:ahlachat/users/presentation/Screans/send_code_signup_screan.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginPhoneScrean extends StatelessWidget {

TextEditingController PhoneNumberTextField=TextEditingController();
TextEditingController PasswordTextField=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar:CustomeAppBar(showpop: true,tittle:getLang( context: context, key: "Login") ,),
       body: BlocBuilder<UserloginBloc, UserloginState>(
         buildWhen: (previous, current) =>
         previous.loginState != current.loginState,
   builder: (context, state) {
        return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 30),
       child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment:CrossAxisAlignment.center ,
           children: [

             Column(   mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment:CrossAxisAlignment.center ,
               children: [
                 SizedBox(height: 100,),
                 CustomeTextField(enable: true,hint:getLang( context: context, key: "InputNumber"),type: TextInputType.phone,Controller:PhoneNumberTextField,obscureText:false ,),
                 SizedBox(height: 20,),
                 CustomeTextField(enable: true,hint:getLang( context: context, key: "Password"),type: TextInputType.visiblePassword,Controller:PasswordTextField ,obscureText: true,),
                 SizedBox(height: 30,),
                 Row(crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(onTap: () => NavigateTo(context: context, screen: SendCodeSignUpScrean()),child: Text(getLang( context: context, key: "Sign_up_now"),style: StyleTitle)),
                     InkWell(onTap: () => NavigateTo(context: context, screen: ForgetPasswordScrean()),child: Text(getLang( context: context, key: "Forget_Password"),style: StyleTitle)),
                   ],
                 ),
               ],
             ),


             UserSharedButton(Buttontittle: getLang(context: context,key: "Login"),onClickAction: (){
            // NavigateTo(context: context, screen: EnterCodeLoginScrean());
               if(!validatePhoneNumber(phoneNumber: PhoneNumberTextField.text)){
                 Showtoast(message:getLang( context: context, key: "Enter_Valid_Phone") );
               } else if(!validatePassword(password: PasswordTextField.text)){
                 Showtoast(message:getLang( context: context, key: "Forget_Length") );
               } else {
                 final myBloc = BlocProvider.of<UserloginBloc>(context);
                 myBloc.add(LoginByPhoneEvent(Phone:PhoneNumberTextField.text,Password: PasswordTextField.text));
               }

             },)
           ],
         ),
     );
   },
),

     );
  }
}
