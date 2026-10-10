import 'dart:convert';

import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';

import 'package:ahlachat/room/presentation/components/buttom_room_widget.dart';
import 'package:ahlachat/room/presentation/components/head_room_widget.dart';
import 'package:ahlachat/chairs/presentation/components/list_chair_room_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/roomchat/presentation/components/room_chat_widget.dart';
import 'package:ahlachat/svga/presentation/components/show_gift_room_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../svga/presentation/components/show_room_entry_widget.dart';
class RoomScrean extends StatelessWidget {
  const RoomScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(InRoom);
    return WillPopScope(
      onWillPop: ()async{
        InRoom=false;
        print(InRoom);
        return true;
      },
      child: Scaffold(resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            BlocBuilder<RoomBloc, RoomState>(
              buildWhen: (previous, current) => previous.CurrentRoom?.screanImage!=current.CurrentRoom?.screanImage,
              builder: (context, state) {
print('previous.CurrentRoom?.screanImage previous.CurrentRoom?.screanImage previous.CurrentRoom?.screanImage');
              return Container(width: SizeConfig.screenWidth!,height: SizeConfig.screenHeight!,child:CachedNetworkImage (
              imageUrl:state.CurrentRoom?.screanImage??AppConstance.ImageUrl('default_back.png'),height: SizeConfig.screenHeight!,width: SizeConfig.screenWidth!,fit: BoxFit.cover,));
  },
),
            Column(
              children: [
                SizedBox(height: 35,),
                Headroomwidget(),
                ChairRoomWidget(),
                Expanded(
                  child: Row( 
                    children: [
                      RoomChatWidget(),
                      Container(width: 75,color: Colors.transparent,child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(Images.Chat_Message,width: 50,),
                          SizedBox(height: 25,)
                        ],
                      )),

                    ],
                  ),
                ),
                ButtomRoomWidget()



              ],
            ),

            ShowEntryRoom(),
            GiftShowWidget(),
          ],
        ),
      ),
    );
  }
}
