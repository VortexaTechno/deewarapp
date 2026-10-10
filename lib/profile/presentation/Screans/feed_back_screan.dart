
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FeedBackScrean extends StatelessWidget {

  TextEditingController FeedBack=TextEditingController();
  TextEditingController Contact=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(showpop: true,tittle: 'I want feedback'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                Container( height: 300,width: SizeConfig.screenWidth,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: TextFormColor

                ),),
                Container( child: CustomeTextField(Controller: FeedBack,hint: 'Please describe in detail the problem and situation you encountered ,thank you for comments',hinthight: 12),width: SizeConfig.screenWidth,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: TextFormColor

                ),),

              ],
            ),
            SizedBox(height: 20,),
            Container( child: CustomeTextField(Controller: Contact,hint: 'Please leave your contact information',hinthight: 12),width: SizeConfig.screenWidth,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: TextFormColor

            ),),
            SizedBox(height: 40,),
            SharedButton(onClickAction: (){
              if(FeedBack.text==''||Contact.text==''){
                 Showtoast(message:getLang(context: context,key: "Complete_fields"));
              }else{
                final myBloc = BlocProvider.of<MyProfileBloc>(
                    context);
                myBloc.add(SubmitFeedBackEvent(contact:Contact.text,descrbe:  FeedBack.text));
                Contact.clear();  FeedBack.clear();
              }

            },Buttontittle: 'Submit',showgradiant: false,colors: MainColor,high: 50,)
          ],
        ),
      ),
    );
  }
}
