import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RemoveGoogleAccount extends StatelessWidget {
  const RemoveGoogleAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(showpop: true,tittle: '',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset(Images.google_ic,height: 100,fit: BoxFit.fill),
            SizedBox(height: 50,),
            Text('لقد راكملت تسجيل الدخول من خلال جوجل يمكنك الاستمرار في إكمال ربط رقم الهاتف و طريقه تسجيل الدخول اكثر ملائمه وامانا',style: StyleTitleBN,),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:  BlocBuilder<UserloginBloc, UserloginState>(
                buildWhen: (previous, current) =>previous.UserProfile?.phone!= current.UserProfile?.phone,
  builder: (context, state) {
    return SharedButton(onClickAction: (){
      if(state.UserProfile?.phone==null){
        Showtoast(message: 'يجب ربط الحساب من خلال رقم الهاتف الخاص بك');
      }else{


      }

              },Buttontittle: 'فك ارتباط جوجل',showgradiant: false,colors: MainColor,high: 50,);
  },
),
            )
          ],
        ),
      ),
    );
  }
}
class RemovePhoneAccount extends StatelessWidget {
  const RemovePhoneAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(showpop: true,tittle: '',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset('assets/image/Profile/icon_phone.png',height: 100,fit: BoxFit.fill),
            SizedBox(height: 50,),
            Text('لقد راكملت تسجيل الدخول من خلال ربط رقم الهاتف   يمكنك الاستمرار في إكمال ربط جوجل و طريقه تسجيل الدخول اكثر ملائمه وامانا',style: StyleTitleBN,),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:BlocBuilder<UserloginBloc, UserloginState>(
                buildWhen: (previous, current) =>previous.UserProfile?.email!= current.UserProfile?.email,
  builder: (context, state) {
    return SharedButton(onClickAction: (){
      if(state.UserProfile?.email==null){
        Showtoast(message: 'يجب ربط الحساب من خلال جوجل الخاص بك');
      }else{
        final myBloc = BlocProvider.of<UserloginBloc>(context);
      myBloc.add(UnBinnedPhone(  ));

      }

              },Buttontittle: 'فك ارتباط ربط الهاتف',showgradiant: false,colors: MainColor,high: 50,);
  },
),
            )
          ],
        ),
      ),
    );
  }
}