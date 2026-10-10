
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/my_profile_bloc.dart';

class MyFollowedScrean extends StatelessWidget {
  const MyFollowedScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          tittle: getLang(context: context, key: "Follow"), showpop: true),
      body: BlocBuilder<MyProfileBloc, MyProfileState>(
       // buildWhen: (previous, current) => previous.GetFriendsState!=current.GetFriendsState,
        builder: (context, state) {
          print(state.Followed.length);
          return ListView.builder(itemCount:state.Followed.length,itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                UserSideInfo(UserData: state.Followed[index],),
                Spacer(),
          if(state.Followed[index].followstatus==true)      InkWell(
            onTap: () {
              final myBloc2 = BlocProvider.of<UserloginBloc>(context);
              final myBloc = BlocProvider.of<MyProfileBloc>(context);

              myBloc.add(ChangeFollowedStatusEvent(index: index, status: false ));

            myBloc2.add(UnFollowUserEvent(id: state.Followed[index].id));
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


