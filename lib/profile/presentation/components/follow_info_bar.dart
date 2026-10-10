
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/Screans/my_followed_screan.dart';
import 'package:ahlachat/profile/presentation/Screans/my_friends_screan.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screans/my_fans_screan.dart';
import '../controller/my_profile_bloc.dart';
class FollowTabBarWidget extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<UserloginBloc, UserloginState>(
          buildWhen: (previous, current) =>
          previous.UserProfile?.nFollowed != current.UserProfile?.nFollowed,
        builder:  (context, state) {
            return    InkWell(
              onTap: () {
                print(sl<MyProfileBloc>().hashCode);

                NavigateTo(context:context, screen: MyFollowedScrean());
                final myBloc = BlocProvider.of<MyProfileBloc>(context);
                myBloc.add(GetMyFollowedEvent());
              },
              child: Column(
                children: [
                  Text(state.UserProfile?.nFollowed.toString()??'',style: StyleTitleBN.copyWith(fontSize: 15)),
                  SizedBox(height: 5),
                  Text(getLang(context: context, key: "Following"),style:StyleTitleGN.copyWith(fontSize: 14)),
                ],
              ),
            );
        },
        ),
    BlocBuilder<UserloginBloc, UserloginState>(
    buildWhen: (previous, current) =>
    previous.UserProfile?.nFollower != current.UserProfile?.nFollower,
    builder:  (context, state) {
      return InkWell(
        onTap: () {
          NavigateTo(context: context, screen: MyFansScrean());
          final myBloc = BlocProvider.of<MyProfileBloc>(context);
          myBloc.add(GetFansEvent());
        },
        child: Column(
          children: [
            Text(state.UserProfile?.nFollower.toString() ?? '',
                style: StyleTitleBN.copyWith(fontSize: 15)),
            SizedBox(height: 5),
            Text(getLang(context: context, key: "Followers"),
                style: StyleTitleGN.copyWith(fontSize: 14)),
          ],
        ),
      );
    } ),
    BlocBuilder<UserloginBloc, UserloginState>(
    buildWhen: (previous, current) =>
    previous.UserProfile?.nFriends != current.UserProfile?.nFriends,

  builder: (context, state) {
    return InkWell(
    onTap: () {

    final myBloc = BlocProvider.of<MyProfileBloc>(context);
    myBloc.add(GetMyFriendsEvent());
    NavigateTo(context: NavigationService.CurrentContext, screen: MyFriendsScrean());
    },
    child: Column(
    children: [
    Text(state.UserProfile?.nFriends.toString()??'',style: StyleTitleBN.copyWith(fontSize: 15)),
    SizedBox(height: 5),
    Text(getLang(context: context, key: "Friends"),style:StyleTitleGN.copyWith(fontSize: 14)),
    ],
    ),
    );
  },
)
      ],
    );
  }
}




