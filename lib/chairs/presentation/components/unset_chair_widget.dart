 
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:provider/provider.dart';

import '../../../core/localization/Localization.dart';
import '../../../core/utils/styles.dart';
class ChairEmptyLockwidget extends StatelessWidget {

  final int index;
  const ChairEmptyLockwidget({ required this.index});
  @override
  Widget build(BuildContext context) {
 
    return  BlocBuilder<RoomBloc, RoomState>(
buildWhen: (previous, current) =>previous.CurrentRoom?.roomChairs?[index]!=current.CurrentRoom?.roomChairs?[index] ,
  builder: (context, state) {

    return  InkWell(onTap: () {
      if(!CheckRoomOwner(id:state.CurrentRoom?.owner?.id )){
        if(state.CurrentRoom?.roomChairs?[index].lock==0){
if(JoinChairStatus){

}else{
final myBloc = BlocProvider.of<ChairBloc>(context);
myBloc.add(JoinChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
}



}else{
print('is lock');
}
      }else{

        showAdaptiveActionSheet(
          context: context,

          actions: <BottomSheetAction>[
            if(  JoinChairStatus==false)      if(state.CurrentRoom?.roomChairs?[index].lock==0)    BottomSheetAction(
              title: const Text('اجلس المايكرفون',style: StyleTitleB),
              onPressed: (_) {
           final myBloc = BlocProvider.of<ChairBloc>(context);
 myBloc.add(JoinChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
                Navigator.pop(context);
              },
            ),
            BottomSheetAction(
              title:   Text(state.CurrentRoom?.roomChairs?[index].lock!=0?getLang(context: context,key: "UnLock"):getLang(context: context,key: "Lock"),style: StyleTitleB),
              onPressed: (_) {
final myBloc = BlocProvider.of<ChairBloc>(context);
if(state.CurrentRoom?.roomChairs?[index].lock==0){
myBloc.add(LockChairEvent(index: index,id:state.CurrentRoom?.roomChairs?[index].id??0));
}else{
myBloc.add(UnLockLockChairEvent(index: index,id:state.CurrentRoom?.roomChairs?[index].id??0));
}


                Navigator.pop(context);
              },
            ),

          ],
          cancelAction: CancelAction(title:   Text(getLang(context: context,key: "Cancel"),style: StyleTitle.copyWith(fontWeight: FontWeight.bold,fontSize: 15),)),
        );

      }

    },child: Image.asset(state.CurrentRoom?.roomChairs?[index].lock!=0? Images.LockChair:Images.Chair ,height: 55,width: 55 ));
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
// final myBloc = BlocProvider.of<ChairBloc>(context);
// if(state.CurrentRoom?.roomChairs?[index].lock==0){
// myBloc.add(LockChairEvent(index: index,id:state.CurrentRoom?.roomChairs?[index].id??0));
// }else{
// myBloc.add(UnLockLockChairEvent(index: index,id:state.CurrentRoom?.roomChairs?[index].id??0));
// }
//
// }if(value==2){
// final myBloc = BlocProvider.of<ChairBloc>(context);
// myBloc.add(JoinChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
// }
// if(  JoinChairStatus==false)      if(CheckRoomOwner(id: state.CurrentRoom?.owner?.id)&&state.CurrentRoom?.roomChairs?[index].lock==0)  _buildPopupMenuItem(title:getLang(context: context,key: "set_chair"),iconData: Icons.chair_outlined,val: 2),
//
// if(CheckRoomOwner(id: state.CurrentRoom?.owner?.id))  _buildPopupMenuItem(title: state.CurrentRoom?.roomChairs?[index].lock!=0?getLang(context: context,key: "UnLock"):getLang(context: context,key: "Lock"),iconData: Icons.lock_outline,val: 0),
//


//
//
// if(state.CurrentRoom?.roomChairs?[index].lock==0){
// if(JoinChairStatus){
//
// }else{
// final myBloc = BlocProvider.of<ChairBloc>(context);
// myBloc.add(JoinChairEvent(index:index,id:state.CurrentRoom?.roomChairs?[index].id??0 ));
// }
//
//
//
// }else{
// print('is lock');
// }