import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/room/presentation/components/user_profile_room_widget.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomChatWidget extends StatelessWidget {
  const RoomChatWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<RoomchatBloc, RoomchatState>(
  builder: (context, state) {
    return Container(child: ListView.builder(physics:BouncingScrollPhysics()  ,controller:scrollControllerChat,itemCount: state.ChatList.length,itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             if(state.ChatList[index].user!=null)  InkWell(onTap: () {
               final myBloc = BlocProvider.of<UserProfileBloc>(context);
               myBloc.add(GetUserProfileRoomEvent(User:state.ChatList[index].user ));
               GBottomSheet(ScreanWidget: RoomUserProfile(), context: context);
             },child: UserSideInfoChat(UserData:state.ChatList[index].user)),

                if(state.ChatList[index].status==0||state.ChatList[index].status==1)     Padding(
                  padding:   EdgeInsets.only(left:state.ChatList[index].status!=0?0: 40,top: 5),
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:state.ChatList[index].user?.CurrentVip?.vip?.fontColor!=null?Color(int.parse(state.ChatList[index].user?.CurrentVip?.vip?.fontColor??'')).withOpacity(0.5): Colors.black.withOpacity(0.3)),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( state.ChatList[index].title??'',style: StyleTitleWN.copyWith(color: state.ChatList[index].status==1?Colors.orange:Colors.white,fontSize: 13),),
                  )),
                ),

                if(state.ChatList[index].status==2)        Padding(
                  padding:   EdgeInsets.only(left:state.ChatList[index].status!=0?0: 40,top: 5),
                  child: InkWell(onTap:() => print(state.ChatList[index].Gift?.id) ,
                    child: Row(
                      children: [
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:state.ChatList[index].user?.CurrentVip?.vip?.fontColor!=null?Color(int.parse(state.ChatList[index].user?.CurrentVip?.vip?.fontColor??'')).withOpacity(0.5): Colors.black.withOpacity(0.3)),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text( getLang(context: context,key: "Send"),style: StyleTitleW.copyWith(color:Colors.orange ,fontSize: 13),),

                              SizedBox(width: 10,),
                              CachedNetworkImage(imageUrl:  state.ChatList[index].Gift?.image??'',width: 50,height: 50),
                              SizedBox(width: 10,),
                              Text( state.ChatList[index].reciveruser?.name??'',style: StyleTitleW ),




                            ],
                          ),
                        )),
                   SizedBox(width: 15,),
                        Image.asset(GiftQuant(quantity: state.ChatList[index].quant),width: 50,height: 50),

                      ],
                    ),
                  ),
                )
              ],

            ),
          );
        }),);
  },
));
  }
}
