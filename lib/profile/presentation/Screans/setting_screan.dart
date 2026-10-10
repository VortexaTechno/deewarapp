import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/account_widget.dart';
import 'package:ahlachat/profile/presentation/components/language_widget.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SettingScrean extends StatelessWidget {
  const SettingScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(showpop: true,tittle: 'Setting'),
    body: CustomScrollView(physics: BouncingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            SettingList(Title: 'Account',onClickAction: (){

              NavigateTo(context: context, screen: AccountWidget());
            },),
            SizedBox(height: 10,),
            SettingList(Title: 'Language',onClickAction: (){
              NavigateTo(context: context, screen: LanguageScrean());

            },),
            SizedBox(height: 10,),
            SettingList(Title: 'BlackList',onClickAction: (){},),
            SizedBox(height: 10,),
            SettingList(Title: 'User agreement',onClickAction: (){},),
            SizedBox(height: 10,),
            SettingList(Title: 'Privacy Policy',onClickAction: (){},),
            SizedBox(height: 30,),
            SharedButton(onClickAction: (){

              final myBloc = BlocProvider.of<UserloginBloc>(context);
              myBloc.add(LogOutEvent());
            },Buttontittle: 'Log out',showgradiant: false,colors: MainColor,high: 50,)

          ],
        ),
      ),)

    ],)

    );
  }
}
class SettingList extends StatelessWidget {
  final String Title;
  final  Function onClickAction;
  SettingList({required  this.onClickAction,required this.Title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:7),
      child: InkWell(
        onTap: ()=>onClickAction(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Title,style: StyleTitleBN.copyWith(fontSize: 14,fontWeight: FontWeight.normal),),
            Icon(Icons.navigate_next,color: Colors.black26,size: 30,)
          ],
        ),
      ),
    );
  }
}