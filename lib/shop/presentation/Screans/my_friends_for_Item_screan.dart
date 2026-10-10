
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/copy_id_widget.dart';

import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';

import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentation/controller/my_profile_bloc.dart';


class MyFriendsForItemScrean extends StatelessWidget {
  const MyFriendsForItemScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          tittle: getLang(context: context, key: "Friends"), showpop: true),
      body: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          return ListView.builder(itemCount:state.Friends.length,itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserSideWithButtonInfo(UserData: state.Friends[index],ButtonTitle: getLang( context: context, key: "Send") ),
          ));
        },
      ),
    );
  }
}

 

class UserSideWithButtonInfo extends StatelessWidget {

  UserModel ?UserData;
  String ?ButtonTitle;
  UserSideWithButtonInfo({required this.UserData,required this.ButtonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.transparent,radius:27  , backgroundImage:CachedNetworkImageProvider(UserData?.image??'') ),
          SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(UserData?.name??'',style: StyleTitleBN),
              SizedBox(height: 10,),
              CopyIdWidget(ID: UserData?.bId ?? UserData?.nId ?? ''),
            ],
          ),
          Spacer(),
          OpenBottomSheetAnimate(ButtonTitle: ButtonTitle, UserData:UserData ),
          SizedBox(width:10),
        ],
      ),
    );
  }
}


