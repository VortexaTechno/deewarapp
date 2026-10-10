import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void RoomKickedMembersButtomSheet(context)async{

  showModalBottomSheet(isScrollControlled: true,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
    ),
    builder: (context) {

      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          width: SizeConfig.screenWidth,

          child: Column(mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height:4,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.refresh,color: Colors.white,),
                    Text('قائمه الحظر',style: StyleTitleB.copyWith(fontSize: 17),),
                    InkWell(onTap: () => Navigator.pop(context),child: Icon(Icons.clear,color: Colors.grey,)),

                  ],
                ),
              ),
              Container(width: SizeConfig.screenWidth,height: 1,color: Colors.white.withOpacity(0.2),),

              SizedBox(height:10,),
              ListOfMemberKicked(),





            ],
          )


        ),
      );
    },
  );
}

class ListOfMemberKicked extends StatelessWidget {
 
  ScrollController? _controller= ScrollController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RoomBloc, RoomState>(
      buildWhen: (previous, current) => previous.ChangeBlockState!=current.ChangeBlockState,
  builder: (context, state) {
    print('UnKickUserEvent UnKickUserEvent UnKickUserEvent UnKickUserEvent UnKickUserEvent UnKickUserEvent');
    return Builder(builder: (context) => Expanded(child:ListView.separated(
        physics: BouncingScrollPhysics(),
        controller:_controller ,
        separatorBuilder: (context, index) =>

            Container(width: SizeConfig.screenWidth,height: 1,color: Colors.grey.withOpacity(0.2),),

        itemBuilder: (context, index)
        {
          return     Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 12),
            child: Row(
              children: [
                UserSideInfo(
                    UserData: state.KickedUsers[index]),
                Spacer(),
                InkWell(onTap:(){

                  final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

                  myBloc.add(UnKickUserEvent( id:state.KickedUsers[index].id??0 ));
                  Navigator.pop(context);
                } ,child: Image.asset(Images.unselected,width: 30,))
              ],
            ),
          );
        }, itemCount: state.KickedUsers.length)),

    );
  },
);
  }
}


