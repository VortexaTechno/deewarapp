import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/core/utils/validation.dart';
import 'package:ahlachat/users/presentation/Screans/enter_code_login_screan.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class UpdateForgetPasswordScrean extends StatelessWidget {

   TextEditingController PasswordTextField=TextEditingController();
  TextEditingController ConfirmPasswordTextField=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomeAppBar(showpop: true,tittle:getLang( context: context, key: "Update_Password") ,),
      body: BlocBuilder<UserloginBloc, UserloginState>(
        buildWhen: (previous, current) =>
        previous.UpdateForgetPasswordState != current.UpdateForgetPasswordState,
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
                    CustomeTextField(enable: true,hint:getLang( context: context, key: "Password"),type: TextInputType.visiblePassword,Controller:PasswordTextField ,obscureText: true,),
                    SizedBox(height: 20,),
                     CustomeTextField(enable: true,hint:getLang( context: context, key: "Confirm_Password"),type: TextInputType.visiblePassword,Controller:ConfirmPasswordTextField ,obscureText: true,),
                    SizedBox(height: 30,),
                    //  CustomeTextField(enable: true,hint:getLang( context: context, key: "Password"),type: TextInputType.visiblePassword,Controller:PasswordTextField ,obscureText: true,),
                    SizedBox(height: 30,),

                  ],
                ),


                UserSharedButton(Buttontittle: getLang(context: context,key: "Done"),onClickAction: (){
                  if(!validatePassword(password: PasswordTextField.text)||!validatePassword(password: ConfirmPasswordTextField.text)){
                    Showtoast(message:getLang( context: context, key: "Forget_Length") );
                  }else  if( PasswordTextField.text!=ConfirmPasswordTextField.text){
                    Showtoast(message:getLang( context: context, key: "Confirm_pass") );
                  } else {
                    print(PasswordTextField.text);
                    print('gooooooooooooooooooooo');
                    final myBloc = BlocProvider.of<UserloginBloc>(context);
                     myBloc.add(UpdatePasswordEvent(Password:PasswordTextField.text));
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
