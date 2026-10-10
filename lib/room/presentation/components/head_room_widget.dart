
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/presentation/components/edit_room_info_widget.dart';
import 'package:ahlachat/room/presentation/components/exit_room_button_sheet_widget.dart';
import 'package:ahlachat/room/presentation/components/room_members_widget.dart';
import 'package:ahlachat/room/presentation/components/room_rank_widget.dart';
import 'package:ahlachat/room/presentation/components/share_room_widget.dart';
import 'package:ahlachat/room/presentation/components/user_profile_room_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spring/spring.dart';

class Headroomwidget extends StatelessWidget {
    Headroomwidget({Key? key}) : super(key: key);
  final SpringController springController =
  SpringController(initialAnim: Motion.loop);
  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(5), ),
                child: Row(
                  children: [
                    BlocBuilder<RoomBloc, RoomState>(
                      buildWhen: (previous, current) =>  previous.CurrentRoom?.image!= current.CurrentRoom?.image,
  builder: (context, state) {
        print('infoRoomsState1 infoRoomsState1 infoRoomsState1');
        return InkWell(onTap: () {
          print(state.CurrentRoom?.FollowRoom);
        },child: Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(5),image: DecorationImage(image: CachedNetworkImageProvider (state.CurrentRoom?.image??AppConstance.ImageUrl('default_back.png')),fit: BoxFit.cover )),height: 50,width: 50));
  },
),
                    SizedBox(width : 5,),
        BlocBuilder<RoomBloc, RoomState>(
          buildWhen: (previous, current) =>  previous.CurrentRoom?.name!= current.CurrentRoom?.name,
  builder: (context, state) {
                  print('infoRoomsState infoRoomsState infoRoomsState');
        return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                      children: [
                        Text( CutName3(name:  state.CurrentRoom?.name??'',length: 11),style:StyleTitleWN.copyWith(fontSize: 15) ),
                        Text(state.CurrentRoom?.owner?.bId ?? state.CurrentRoom?.owner?.nId??'loading... ',style:StyleTitleWN.copyWith(fontSize: 10)),
                      ],
                    );
  },
),
                    SizedBox(width : 20,),
                    BlocBuilder<RoomBloc, RoomState>(
                   buildWhen: (previous, current) => previous.CurrentRoom?.FollowRoom!=current.CurrentRoom?.FollowRoom|| previous.JoinVoiceRoomState!=current.JoinVoiceRoomState,

                      builder: (context, state) {
                         print('FollowRoomsState FollowRoomsState FollowRoomsState');
                        if(state.CurrentRoom?.FollowRoom==0){
                          return InkWell(onTap: () {
                            final myBloc = BlocProvider.of<RoomBloc>(context);
                            myBloc.add(FollowRoomsevent());

                          },child: Image.asset( Images.FollowRoom,height: 35,));
                        }else if(state.CurrentRoom?.FollowRoom==1){
                          return InkWell(onTap: () {
                            final myBloc = BlocProvider.of<RoomBloc>(context);
                            myBloc.add(UnFollowRoomsevent());
                          },child: Image.asset( Images.UnFollowRoom,height: 35,));
                        }
                        return SizedBox();


                      },
                    ),
                    SizedBox(width : 10,),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                InkWell(onTap: () {
                  ShowShareButtomSheet(context);
                },child: Image.asset(Images.ShareRoom,height: 28,)),
                SizedBox(width : 5,),
                BlocBuilder<RoomBloc, RoomState>(
  builder: (context, state) {
    if(!CheckRoomOwner(id: state.CurrentRoom?.owner?.id)){
      return SizedBox();
    }
    return InkWell(onTap: () {
                  ShowEditRoomButtomSheet(context);
                },child: Image.asset(Images.fun_setting,height: 30,));
  },
),


                SizedBox(width : 5,),
                InkWell(onTap: () {
                  ShowExitRoomButtomSheet(context);
                },child: Image.asset(Images.ExitRoom,height: 28,)),


              ],
            )



          ],
        ),
        SizedBox(height:  10),
        BlocBuilder<RoomBloc, RoomState>(
          buildWhen: (previous, current) =>  previous.CurrentRoom?.joinNum!= current.CurrentRoom?.joinNum,
  builder: (context, state) {
    return Row(
          children: [
            InkWell(
              onTap: () {
             RoomMembersButtomSheet(context,state.CurrentRoom?.joinNum);
             final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
             myBloc.add(GetJoinMemberRoomEvent());
            },
              child: CircleAvatar(radius: 19,backgroundColor:   Colors.white12,child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Icon(Icons.person,color: Colors.white,size: 18),
                Text(state.CurrentRoom?.joinNum.toString()??'',style: StyleTitleW.copyWith(fontSize: 10),)
              ]),),
            ),
            SizedBox(width: 5,),
       if(state.CurrentRoom!=null&&state.CurrentRoom?.id!=null)     Container(color: Colors.transparent,height: 50,width: 200,child: ListView.builder(scrollDirection: Axis.horizontal,
             itemCount: state.CurrentRoom?.highmembers?.length,
              itemBuilder: (context, index) => Padding(
              padding:   EdgeInsets.symmetric(horizontal: 2),
              child: InkWell(onTap: () {

                final myBloc = BlocProvider.of<UserProfileBloc>(context);
                myBloc.add(GetUserProfileRoomEvent(User:state.CurrentRoom?.highmembers![index] ));
                GBottomSheet(ScreanWidget: RoomUserProfile(), context: context);
              },child: CircleAvatar(backgroundColor: Colors.transparent,radius:19,backgroundImage: CachedNetworkImageProvider(state.CurrentRoom?.highmembers![index].image??''), )),
            ),)),
            Spacer(),
            InkWell(
              onTap: () {
                RankRoomButtomSheet(context);
              },
              child:    BlocBuilder<RoomBloc, RoomState>(
                buildWhen: (previous, current) =>  previous.CurrentRoom?.donate!= current.CurrentRoom?.donate,
  builder: (context, state) {
    return Container(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6,vertical:5),
                child: Row(children: [
                  Text(k_m_b_generator( state.CurrentRoom?.donate)  ,style: StyleTitle.copyWith(color: Colors.orange)),
                  SizedBox(width: 5),
                  Image.asset(Images.roomrank,height: 22),

                ]),
              ),decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20))),);
  },
),
            )
          ],
        );
  },
)
      ],
    );
  }
}




