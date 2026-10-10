
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/my_profile_bloc.dart';

class MyFriendsScrean extends StatelessWidget {
  const MyFriendsScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          tittle: getLang(context: context, key: "Friends"), showpop: true),
      body: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          return ListView.builder(itemCount:state.Friends.length,itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                UserSideInfo(UserData: state.Friends[index],),
                Spacer(),
                if(state.Friends[index].followstatus==true)      InkWell(
                  onTap: () {
                    final myBloc2 = BlocProvider.of<UserloginBloc>(context);
                    final myBloc = BlocProvider.of<MyProfileBloc>(context);

                    myBloc.add(ChangeFrindsStatusEvent(index: index, status: false ));

                    myBloc2.add(UnFollowUserEvent(id: state.Friends[index].id));
                  },
                  child: Container(decoration: BoxDecoration(color: MainColor,borderRadius: BorderRadius.circular(20)),child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Text(getLang(context: context,key: "UnFollow"),style: StyleTitleW),
                  ),),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}




