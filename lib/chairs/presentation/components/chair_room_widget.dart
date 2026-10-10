

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:ahlachat/chairs/data/ViewModel/emoje_view_model.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';

import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/components/user_frame_size1.dart';
import 'package:ahlachat/room/presentation/components/user_profile_room_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Chairwidget extends StatelessWidget {
  final int index;
  Chairwidget({ required this.index});

  @override
  Widget build(BuildContext context) {


    return  BlocBuilder<RoomBloc, RoomState>(
  builder: (context, state) {
    print('eqweqweqweqweqwewqeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeettttttttttttttttttttttttttttttttttttttt');
    return InkWell(
      onTap: () {
        if(!CheckRoomOwner(id: state.CurrentRoom?.owner?.id)&&state.CurrentRoom?.roomChairs?[index].user?.id.toString()!=UserId){
          final myBloc = BlocProvider.of<UserProfileBloc>(context);
          myBloc.add(GetUserProfileRoomEvent(User:state.CurrentRoom?.roomChairs?[index].user ));
          GBottomSheet(ScreanWidget: RoomUserProfile(), context: context);

        }else{
          showAdaptiveActionSheet(
            context: context,

            actions: <BottomSheetAction>[
              if(CheckRoomOwner(id: state.CurrentRoom?.owner?.id)&&state.CurrentRoom?.roomChairs?[index].hostId.toString()!=UserId)BottomSheetAction(
                title: const Text('انزال المايكرفون',style: StyleTitleB),
                onPressed: (_) {

                  final myBloc = BlocProvider.of<ChairBloc>(context);
                  myBloc.add(LeaveUserChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
                  Navigator.pop(context);
                },
              ),
              if(state.CurrentRoom?.roomChairs?[index].hostId.toString()==UserId)     BottomSheetAction(
                title: const Text('اترك المايكرفون',style: StyleTitleB),
                onPressed: (_) {

                  final myBloc = BlocProvider.of<ChairBloc>(context);
                  myBloc.add(LeaveChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
                  Navigator.pop(context);
                },
              ),
              BottomSheetAction(
                title: const Text('الملف الشخصي',style: StyleTitleB),
                onPressed: (_) {
                  Navigator.pop(context);

                  final myBloc = BlocProvider.of<UserProfileBloc>(context);
                  myBloc.add(GetUserProfileRoomEvent(User:state.CurrentRoom?.roomChairs?[index].user ));
                  GBottomSheet(ScreanWidget: RoomUserProfile(), context: context);

                },
              ),
              if(CheckRoomOwner(id: state.CurrentRoom?.owner?.id)&&state.CurrentRoom?.roomChairs?[index].hostId.toString()!=UserId)    BottomSheetAction(
                title: const Text('طرد الغرفه',style: StyleTitleB),
                onPressed: (_) {
                  Navigator.pop(context);
                  final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

                  myBloc.add(KickUserEvent( id: state.CurrentRoom?.roomChairs?[index].hostId??0 ));

                },
              ),
            ],
            cancelAction: CancelAction(title:   Text(getLang(context: context,key: "Cancel"),style: StyleTitle.copyWith(fontWeight: FontWeight.bold,fontSize: 15),)),
          );
        }

      },
      child: Stack(
        children: [
          Column(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserFrameWidget2(UserProfile:state.CurrentRoom?.roomChairs![index].user ),

              SizedBox(height: 3,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(CutName3(name: state.CurrentRoom?.roomChairs![index].user?.name??"",length: 8 ),style: StyleTitleW.copyWith(fontSize: 10),),
                  SizedBox(width:  3,),
                  Container(decoration: BoxDecoration(color: state.CurrentRoom?.roomChairs![index].user?.sex=='1'?Colors.pink:Colors.blue,   shape: BoxShape.circle),child: Center(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text((index+1).toString(),style: StyleTitleW.copyWith(fontSize: 8,)),
                  ),))
                ],
              )


            ],
          ),
          Align(alignment: Alignment.centerRight,child: Icon( state.CurrentRoom?.roomChairs![index].mic==0? Icons.mic:Icons.mic_off,color:  Colors.white,size:20)),
          //


          Consumer<EmojeViewmodel>(builder: (context, mainModel, child) {
            if(mainModel.EmojeList.any((element) =>element.id==state.CurrentRoom?.roomChairs![index].id) ){
              return    Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(height: 80,width: 80,color: Colors.transparent,child: CachedNetworkImage(imageUrl: mainModel.EmojeList.where((element) => element.id==state.CurrentRoom?.roomChairs![index].id).first.emoje??''),),
              );
            }

            return SizedBox();

          })

        ],
      ),
    );
  },
);
  }
}
PopupMenuItem _buildPopupMenuItem({String ?title, IconData ?iconData,int ?val}) {
  return PopupMenuItem(value: val,height: 30,padding: EdgeInsets.all(0),
    child:  Row(
      children: [
        SizedBox(width: 5,),
        Icon(iconData, color: MainColor,size:  14),
        SizedBox(width: 5,),
        Text(title??'',style: StyleTitle.copyWith(color: MainColor,height: 1,fontSize: 13)),
      ],
    ),
  );
}


// if(value==0){
//
// GBottomSheet(ScreanWidget: RoomUserProfile(), context: context);
// }else if(value==2){
//
// final myBloc = BlocProvider.of<ChairBloc>(context);
// myBloc.add(LeaveChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
// }else if(value==3){
// final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
//
// myBloc.add(KickUserEvent( id: state.CurrentRoom?.roomChairs?[index].hostId??0 ));
// }
