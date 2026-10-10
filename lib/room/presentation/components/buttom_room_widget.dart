import 'package:ahlachat/agora/presentation/controller/agora_bloc.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/chairs/presentation/components/show_emoje_widget.dart';
import 'package:ahlachat/gift/presentation/components/show_gift_Box.dart';
import 'package:ahlachat/gift/presentation/controller/gift_bloc.dart';
import 'package:ahlachat/roomchat/presentation/components/send_message_widget.dart';
import 'package:ahlachat/svga/data/ViewModel/show_entry_view_model.dart';
import 'package:ahlachat/svga/presentation/controller/svga_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class ButtomRoomWidget extends StatelessWidget {
  const ButtomRoomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(height : 50,
      child: Row(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 10,),
              BlocBuilder<AgoraBloc, AgoraState>(
             buildWhen: (previous, current) => previous.mutedMic!=current.mutedMic,
  builder: (context, state) {
    print(state.mutedMic);
    print('aeaweasdase a');
    return InkWell(onTap:() {
      print('zzxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      final myBloc = BlocProvider.of<ChairBloc>(context);
      if(JoinChairStatus==true){



        if(state.mutedMic){
          myBloc.add(OpenMicChairEvent());

        }else{
          myBloc.add(CloseMicChairEvent());
        }
      }
    }, child: CircleAvatar(backgroundColor: BackgroundGray.withOpacity(0.3),child: Image.asset(state.mutedMic?Images.Mic_disable:Images.Mic,height: 25)));
  },
),
              SizedBox(width: 10,),
              BlocBuilder<AgoraBloc, AgoraState>(
                buildWhen: (previous, current) => previous.muted!=current.muted,

                builder: (context, state) {
    return InkWell(onTap:() {
      final myBloc = BlocProvider.of<AgoraBloc>(context);

      if(state.muted){
        myBloc.add(ChangeSoundStausEvent(status: 0));

      }else{
        myBloc.add(ChangeSoundStausEvent(status: 1));
      }
      print(state.muted);      print(state.mutedMic);
    } ,child: CircleAvatar(backgroundColor: BackgroundGray.withOpacity(0.3),child: Image.asset(state.muted?Images.Volume_disable:Images.Volume,height: 25)));
  },
),
              SizedBox(width: 10,),
              // CircleAvatar(backgroundColor: BackgroundGray.withOpacity(0.3),child: Image.asset(Images.bar_more,height: 25)),
              // SizedBox(width: 10,),
              InkWell(onTap: (){
                ShowMessagButtom(context);
              },child: CircleAvatar(backgroundColor: BackgroundGray.withOpacity(0.3),child: Image.asset(Images.bar_chat,height: 25))),
              SizedBox(width: 10,),
              InkWell(onTap: () =>ShowEmojeButtomSheet(context),child: CircleAvatar(backgroundColor: BackgroundGray.withOpacity(0.3),child: Image.asset(Images.bar_emoji,height: 25))),
              SizedBox(width: 10,),
            ],
          ),
          Spacer(),
          InkWell(onTap: () {


            ShowGiftButtomSheet(context);
            final myBloc = BlocProvider.of<GiftBloc>(context);
if(myBloc.state.Gifts.isEmpty){
  myBloc.add(GetGiftsEvent());
}




          },child: Container(width: 50,child: SVGASimpleImage(assetsName: Images.gift_icon),)),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
