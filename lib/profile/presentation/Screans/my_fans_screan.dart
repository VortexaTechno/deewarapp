
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/my_profile_bloc.dart';

class MyFansScrean extends StatelessWidget {
  const MyFansScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          tittle: getLang(context: context, key: "Fans"), showpop: true),
      body: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          return ListView.builder(itemCount:state.Fans.length,itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              UserSideInfo(UserData: state.Fans[index],),
              Spacer(),
              if(state.Fans[index].followstatus==false)      InkWell(
                onTap: () {
                  final myBloc2 = BlocProvider.of<UserloginBloc>(context);
                  final myBloc = BlocProvider.of<MyProfileBloc>(context);

                  myBloc.add(ChangeFollowerStatusEvent(index: index, status: true ));

                  myBloc2.add(FollowUserEvent(id: state.Fans[index].id));
                },
                child: Container(decoration: BoxDecoration(color: MainColor,borderRadius: BorderRadius.circular(20)),child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  child: Text(getLang(context: context,key: "Follow"),style: StyleTitleW),
                ),),
              )
            ], ),
          ));
        },
      ),
    );
  }
}


