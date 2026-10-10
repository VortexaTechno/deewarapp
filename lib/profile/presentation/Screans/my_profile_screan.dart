
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';

import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/Screans/edit_profile_screan.dart';
import 'package:ahlachat/profile/presentation/Screans/feed_back_screan.dart';
import 'package:ahlachat/profile/presentation/Screans/level_screan.dart';
import 'package:ahlachat/profile/presentation/Screans/setting_screan.dart';
import 'package:ahlachat/profile/presentation/components/copy_id_widget.dart';
import 'package:ahlachat/profile/presentation/components/user_frame_size1.dart';
import 'package:ahlachat/recharge/presentation/Screans/charge_screan.dart';

import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/userprofile/presentation/Screans/user_profile_screan.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:ahlachat/vip/presentation/controller/vip_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/follow_info_bar.dart';
import '../controller/my_profile_bloc.dart';

class MyProfileScrean extends StatelessWidget {
  const MyProfileScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: BouncingScrollPhysics(),
        slivers: [

          SliverToBoxAdapter(
            child:     Column(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(onTap: () {
                      NavigateTo(context: context, screen: EditProfileScrean());
                      },child: Image.asset(Images.ic_edit,height: 25)),
                      Spacer(),
                      Opacity(opacity: 0.0,child: Icon(Icons.add,color: Colors.black54,))
                    ],
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child:   BlocBuilder<UserloginBloc, UserloginState>(
              // buildWhen: (previous, current) =>
              // previous.UserProfile != current.UserProfile,
              builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          InkWell(onTap: () {
            print(state.UserProfile?.Entry?.items?.svga);
            // final myBloc = BlocProvider.of<UserProfileBloc>(context);
            // myBloc.add(GetUserProfileEvent(User:state.UserProfile ));
          },
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserFrameWidget1(UserProfile: state.UserProfile),
                SizedBox(height: 10,),
                Text(state.UserProfile?.name ?? '', style: StyleTitleB),
                SizedBox(height: 10,),
                CopyIdWidget(ID: state.UserProfile?.bId ?? state
                    .UserProfile?.nId ?? ''),
              ],
            ),
          ),

          SizedBox(height: 20),

          FollowTabBarWidget(),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: InkWell(onTap: () {
                NavigateTo(context: context, screen: ChargeScrean());
              },
                child: Container(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(getLang(context: context, key: "income"),style: StyleTitleW.copyWith(fontSize: 12)),
                          Icon(Icons.navigate_next,color: Colors.white,size: 14,)
                        ],
                      ),
                      Row(children: [
                        Image.asset(Images.Coins,height: 15),
                        SizedBox(width:   5),
                        BlocBuilder<UserloginBloc, UserloginState>(
                          buildWhen: (previous, current) =>
                          previous.UserProfile?.coin != current.UserProfile?.coin,
  builder: (context, state) {
    return Text(state.UserProfile?.coin.toString()??"",style: StyleTitleWN.copyWith(fontSize: 12));
  },
),
                      ],)
                    ],
                  ),
                ),height: 70,decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ProfileIncome))),),
              )),
              SizedBox(width: 10,),
              Expanded(child: Container(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(getLang( context: context, key: "Agencies"),style: StyleTitleW.copyWith(fontSize: 12)),
                        Icon(Icons.navigate_next,color: Colors.white,size: 14,)
                      ],
                    ),
                    Opacity(opacity: 0.0,
                      child: Row(children: [
                        Image.asset(Images.Coins,height: 17),
                        SizedBox(width:   5),
                        Text('0',style: StyleTitleWN),
                      ],),
                    )
                  ],
                ),
              ),height: 70,decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ProfileAgency))),))

            ],
          ),
          SizedBox(height: 5),
          ProfileList(image: Images.IconMall,Title: getLang( context: context, key: "Shop_tittle"),onClickAction:()async{
            print(sl<MyProfileBloc>().hashCode);

            final myBloc = BlocProvider.of<ShopBloc>(context);


            myBloc.add(GetShopPackageEvent());




          } ),
          ProfileList(image: Images.IconAudio,Title: getLang( context: context, key: "MyRoom"),onClickAction:(){} ),
          ProfileList(image: Images.IconVip,Title: getLang( context: context, key: "Vip_Center"),onClickAction:(){
            final myBloc = BlocProvider.of<VipBloc>(context);
            myBloc.add(GetVipShopEvent());

          } ),
          ProfileList(image: Images.IconLevel,Title: getLang( context: context, key: "Level"),onClickAction:(){

          final myBloc = BlocProvider.of<MyProfileBloc>(context);
          myBloc.add(GetLevelEvent());
          } ),
          ProfileList(image: Images.IconMedal,Title: getLang( context: context, key: "Models"),onClickAction:(){
            final myBloc = BlocProvider.of<MyProfileBloc>(context);
            myBloc.add(GetMedalEvent());
          } ),
          ProfileList(image: Images.IconFeedback,Title: getLang( context: context, key: "Feedback"),onClickAction:(){
        NavigateTo(context: context, screen: FeedBackScrean());

          } ),
          ProfileList(image: Images.IconSetting,Title: getLang( context: context, key: "setting"),onClickAction:(){
            NavigateTo(context: context, screen: SettingScrean());
          } ),

        ],
      ),
    );
  },
),
          ),

        ],
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  final String image;
  final String Title;
  final  Function onClickAction;
  ProfileList({required this.image,required  this.onClickAction,required this.Title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:7),
      child: InkWell(
        onTap: ()=>onClickAction(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image,height: 30,width: 30),
                SizedBox(width: 5),
                Text(Title,style: StyleTitleBN.copyWith(fontSize: 12,fontWeight: FontWeight.normal),)
              ],
            ),
            Icon(Icons.navigate_next,color: Colors.black26,size: 30,)
          ],
        ),
      ),
    );
  }
}

