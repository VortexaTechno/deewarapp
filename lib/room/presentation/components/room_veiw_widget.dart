
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';
import 'package:ahlachat/room/presentation/Screans/room_screan.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomViewWidget extends StatelessWidget {
  RoomModel? Info;
  RoomViewWidget({required this.Info});
  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap: () {
        final myBloc = BlocProvider.of<RoomBloc>(context);
        if(myBloc.state.CurrentRoom!=null&&myBloc.state.CurrentRoom?.id==Info?.id){
          InRoom=true;
          NavigateTo(context: context, screen: RoomScrean());
        } else if(myBloc.state.CurrentRoom!=null&&myBloc.state.CurrentRoom!=RoomModel()&&myBloc.state.CurrentRoom?.id!=Info?.id){
        //  NavigateTo(context: context, screen: RoomScrean());

          showCustomDialog(context: context,tittle: "هذا سيتسبب في غلق الغرفه",Btitle:"هل انت متأكد من مغادره الغرفه ؟",ontap: (){

            Navigator.pop(context);

            myBloc.add(JoinVoiceRoomEvent(id: Info?.id??0));
          });
        }else{
          myBloc.add(JoinVoiceRoomEvent(id: Info?.id??0));
        }


      },
      child: Stack(fit: StackFit.expand,children: [
        Padding(
          padding:   EdgeInsets.all(Info?.owner?.CurrentVip?.vip?.roomFrame=='1'?5:0),
          child: Container(   decoration: BoxDecoration(    borderRadius: BorderRadius.circular(10), image: DecorationImage(fit: BoxFit.fill,image: CachedNetworkImageProvider(Info?.image??''))),),
        ),
        Align(alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(5).copyWith(bottom: Info?.owner?.CurrentVip?.vip?.roomFrame=='1'?25:8,left:  Info?.owner?.CurrentVip?.vip?.roomFrame=='1'?12:8,right:  Info?.owner?.CurrentVip?.vip?.roomFrame=='1'?12:8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(Info?.name .toString()??'',maxLines: 1,style: StyleTitleW.copyWith( fontSize: 10),),
               SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        Text( k_m_b_generator(Info?.donate!.abs()),maxLines: 1,style: StyleTitleW.copyWith( fontSize: 10),),
                        const SizedBox(width: 5,),
                        const FaIcon( FontAwesomeIcons.fire,size: 11,color: Colors.white),
                      ],
                    ),
                    Text(Info?.owner?.name.toString()??'',maxLines: 1,style: StyleTitleW.copyWith( fontSize: 10,color: Colors.white.withOpacity(0.7)),),
                  ],
                ),
              ],
            ),
          ),
        ),

   if(Info?.owner?.CurrentVip?.vip?.roomFrame=='1')  Image.asset(Images.vip_room_frame,fit: BoxFit.cover),

        if(Info?.secure==1)  Align(alignment: Alignment.center,child: SizedBox(width: 30,height: 30,child: Image.asset(Images.room_locak)))
      ],
      ),
    );


  }
}
