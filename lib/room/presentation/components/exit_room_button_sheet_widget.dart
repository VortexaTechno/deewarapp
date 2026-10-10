import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void ShowExitRoomButtomSheet(context)async{


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
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
        child: Container(
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
          width: SizeConfig.screenWidth,

          child: BlocBuilder<RoomBloc, RoomState>(

            builder: (context, state) {
              print('exitRoomBloc  exitRoomBlocexitRoomBlocexitRoomBlocexitRoomBlocexitRoomBloc');
              return Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.password,color: Colors.white,),
                  SizedBox(height:10,),

                  SizedBox(height: 20,),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell( onTap: () {
                        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
                        myBloc.add(LeaveVoiceRoomEvent(id:RoomId!));
                        Navigator.pop(context);

                        Navigator.pop(context);
                      },
                        child: Column(
                          children: [
                            Image.asset(Images.exitroom,height: 70),
                            SizedBox(height:10,),
                            Text('خروج',style: StyleTitleW),
                          ],
                        ),
                      ),
                      InkWell( onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                        child: Column(
                          children: [
                            Image.asset(Images.saveroom,height: 70),
                            SizedBox(height:10,),
                            Text('احتفظ',style: StyleTitleW),

                          ],
                        ),
                      ),
                      InkWell(onTap: () {
                        Showtoast(message:getLang(key: "Report",context: context));
                        Navigator.pop(context);
                      },
                        child: Column(
                          children: [
                            Image.asset(Images.reportroom,height: 70),
                            SizedBox(height:10,),
                            Text('ابلاغ',style: StyleTitleW),

                          ],
                        ),
                      ),

                    ],),
                  SizedBox(height: 20,),


                ],
              );
            },
          ),


        ),
      );
    },
  );
}