import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ShowMessagButtom(context){
  TextEditingController name=TextEditingController();
  showModalBottomSheet(

      isScrollControlled: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
      ),
      builder: (context) {
        return Padding(padding: EdgeInsets.all(10),

          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(color: BackgroundGray.withOpacity(0.1),
                          child: Row(
                            children: [

                              Expanded(
                                child: TextFormField(controller: name,
                                  autofocus: true,
                                  style: StyleTitleWN,


                                ),
                              ),
                              SizedBox(width: 10,),
                              BlocBuilder<UserloginBloc, UserloginState>(
                                buildWhen: (previous, current) => false,
  builder: (context, state) {
    return InkWell(onTap: () {
                                final myBloc2 = BlocProvider.of<RoomchatBloc>(context);


                                myBloc2.add( AddNewMessageToChatEvent(status: 0,user: state.UserProfile!,tittle:name.text));
                                myBloc2.add(SendMessageToChatEvent(tittle:name.text )  );
                                Navigator.pop(context);
                              },child: Image.asset(Images.send_icon,width: 40,height: 30,));
  },
),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}