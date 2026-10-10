import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:flutter/material.dart';

class FollowProfileTabBarWidget extends StatelessWidget {
  UserModel ?UserData;
  FollowProfileTabBarWidget({required this.UserData});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(UserData?.nFollowed.toString()??'',style: StyleTitleBN.copyWith(fontSize: 15)),
            SizedBox(width:   5),
            Text(getLang(context: context, key: "Following"),style:StyleTitleGN.copyWith(fontSize: 12)),
          ],
        ),
        Row(
          children: [
            Text(UserData?.nFollower.toString()??'',style: StyleTitleBN.copyWith(fontSize: 15)),
            SizedBox(width:   5),
            Text(getLang(context: context, key: "Followers"),style:StyleTitleGN.copyWith(fontSize: 12)),
          ],
        ),
        Row(
          children: [
            Text(UserData?.nFriends.toString()??'',style: StyleTitleBN.copyWith(fontSize: 15)),
            SizedBox(width:   5),
            Text(getLang(context: context, key: "Friends"),style:StyleTitleGN.copyWith(fontSize: 12)),
          ],
        )
      ],
    );
  }
}