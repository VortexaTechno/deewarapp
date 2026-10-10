import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/Screans/set_phone_for_account_screan.dart';
import 'package:ahlachat/profile/presentation/components/un_binned_account.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(showpop: true,tittle:"Account"),
      body:  BlocBuilder<UserloginBloc, UserloginState>(
        buildWhen: (previous, current) =>previous.UserProfile!= current.UserProfile,
  builder: (context, state) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(physics: BouncingScrollPhysics(),
    slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(vertical:7),
          child: InkWell(
            onTap: (){
              if(state.UserProfile?.email==null){

              }else{
                NavigateTo(context: context, screen: RemoveGoogleAccount());

              }
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(state.UserProfile?.email==null?'assets/image/Profile/icon_google.png':'assets/image/Profile/setting_icon_google.png',height: 30,width: 30),
                    SizedBox(width: 5),
                    Text('Google',style: StyleTitleBN.copyWith(fontSize: 12,fontWeight: FontWeight.normal),)
                  ],
                ),

                Row(
                  children: [
                    Text(state.UserProfile?.email==null?getLang(context:context,key: "Not_set"):getLang(context:context,key: "is_set"),style: StyleTitleG,),
                    Icon(Icons.navigate_next,color: Colors.black26,size: 25,),
                  ],
                )
              ],
            ),
          ),
        ),),

      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.symmetric(vertical:7),
        child: InkWell(
          onTap: (){
            if(state.UserProfile?.phone==null){

              NavigateTo(context: context, screen: SetPhoneAccountScrean());
            }else{
              NavigateTo(context: context, screen: RemovePhoneAccount());



            }

          },
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(state.UserProfile?.phone==null?'assets/image/Profile/icon_phone.png':'assets/image/Profile/ic_me_verify_phone.png',height: 30,width: 30),
                  SizedBox(width: 5),
                  Text('Phone',style: StyleTitleBN.copyWith(fontSize: 12,fontWeight: FontWeight.normal),)
                ],
              ),

              Row(
                children: [
                  Text(state.UserProfile?.phone==null?getLang(context:context,key: "Not_set"):getLang(context:context,key: "is_set"),style: StyleTitleG,),
                  Icon(Icons.navigate_next,color: Colors.black26,size: 25,),
                ],
              )
            ],
          ),
        ),
      ),)
    ]),
      );
  },
)
    );
  }
}
