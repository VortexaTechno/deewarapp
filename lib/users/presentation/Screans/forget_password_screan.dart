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
class ForgetPasswordScrean extends StatelessWidget {

  TextEditingController PhoneNumberTextField=TextEditingController();
  TextEditingController PasswordTextField=TextEditingController();
  TextEditingController CodeTextField=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomeAppBar(showpop: true,tittle:getLang( context: context, key: "Forget_Password2") ,),
      body: BlocBuilder<UserloginBloc, UserloginState>(
        buildWhen: (previous, current) =>
        previous.SendCodeForgetPasswordState != current.SendCodeForgetPasswordState,
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
                    CustomeTextField(enable: true,hint:getLang( context: context, key: "Enter_Code"),type: TextInputType.number,Controller:CodeTextField ,obscureText: false,
                    SideWidget:   InkWell(onTap: () {
                      if(!validatePhoneNumber(phoneNumber: PhoneNumberTextField.text)){
                        Showtoast(message:getLang( context: context, key: "Enter_Valid_Phone") );
                      }else{
                        final myBloc = BlocProvider.of<UserloginBloc>(context);
                        myBloc.add(SendCodeForgetPasswordEvent(Phone:PhoneNumberTextField.text));
                      }
                    },
                      child: Container(child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                       child: Text( getLang( context: context, key: "Send_Code"),style: StyleTitle,),
                       ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: MainColor,width:1)),
                      ),
                    ),),
                    SizedBox(height: 30,),
                  //  CustomeTextField(enable: true,hint:getLang( context: context, key: "Password"),type: TextInputType.visiblePassword,Controller:PasswordTextField ,obscureText: true,),
                    SizedBox(height: 30,),

                  ],
                ),


                UserSharedButton(Buttontittle: getLang(context: context,key: "Done"),onClickAction: (){
                  if(!validatePhoneNumber(phoneNumber: PhoneNumberTextField.text)){
                    Showtoast(message:getLang( context: context, key: "Enter_Valid_Phone") );
                  }  if(CodeTextField.text.length<4){
                    Showtoast(message: getLang(context: context, key: "Correct_Verification"));
                  } else {
                    print('gooooooo');
                    final myBloc = BlocProvider.of<UserloginBloc>(context);
                    myBloc.add(ForgetPasswordEvent(Phone:PhoneNumberTextField.text,Code:CodeTextField.text ));
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
