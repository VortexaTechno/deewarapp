import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/my_level_icon_widget.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class UserSideInfo extends StatelessWidget {

  UserModel ?UserData;
  UserSideInfo({required this.UserData});

  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: () {
      final myBloc = BlocProvider.of<UserProfileBloc>(context);
      myBloc.add(GetUserProfileEvent(User:UserData));
    },
      child: Container(
        child: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.transparent,radius:23  , backgroundImage:CachedNetworkImageProvider(UserData?.image??'') ),
            SizedBox(width: 10,),
            Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(UserData?.name??'',style: StyleTitleBN),
                    SizedBox(width: 5,),
                    if(UserData?.sex=='0')Image.asset(Images.femal_ic,height: 15,)

                  ],
                ),
                Row(
                  children: [
                    WealthIconWidget(donate:UserData?.donate??0 ,hight: 18,),
                    IncomeIconWidget(Income:UserData?.gInput??0 ,hight: 18,),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}


class UserSideInfoChat extends StatelessWidget {

  UserModel ?UserData;
  UserSideInfoChat({required this.UserData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.transparent,radius:17  , backgroundImage:CachedNetworkImageProvider(UserData?.image??'') ),
          SizedBox(width: 10,),
          Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(UserData?.name??'',style: StyleTitleWN.copyWith(fontSize: 12)),
              Row(
                children: [
                  WealthIconWidget(donate:UserData?.donate??0 ,hight: 14,),
                  IncomeIconWidget(Income:UserData?.gInput??0 ,hight: 14,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}