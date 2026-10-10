import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/room/presentation/components/room_kicked_members_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void ShowEditRoomButtomSheet(context)async{


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
            buildWhen: (previous, current) => previous.CurrentRoom!=current.CurrentRoom,

  builder: (context, state) {
    print('EditRoomBloc  EditRoomBlocEditRoomBlocEditRoomBlocEditRoomBloc CurrentRoom');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.password,color: Colors.white,),
                SizedBox(height:10,),
                Text('تعديل معلومات الغرفه',style: StyleTitleW.copyWith(fontSize: 15),),
                SizedBox(height: 20,),
Row(crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
      SizedBox(width:  20,),
      InkWell(onTap: () {
        final myBloc = BlocProvider.of<RoomBloc>(context);
        myBloc.add(ChangeRoomImageEvent());
      },child: Container(height: 60,width: 60,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),image: DecorationImage(image: CachedNetworkImageProvider(state.CurrentRoom?.image??'' ))),)),
      SizedBox(width:  20,),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Host : ${state.CurrentRoom?.owner?.name??''}',style: TextStyle(color: BackgroundGray.withOpacity(0.5) )),
          Text('ID : ${state.CurrentRoom?.owner?.bId??state.CurrentRoom?.owner?.nId}',style: TextStyle(color: BackgroundGray.withOpacity(0.5) )),
        ],
      ),
  ],),
                SizedBox(height: 20,),
                Container(height: 1,width: SizeConfig.screenWidth,color: BackgroundGray.withOpacity(0.5) ,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      InkWell(onTap: () {
                        final myBloc = BlocProvider.of<RoomBloc>(context);
                        myBloc.add(ChangeRoomBackGroundImageEvent());

                      },
                        child: Row(
                          children: [
                            Text('Background Image',style: StyleTitleWN.copyWith(fontSize: 12)),
                            Spacer(),
                            Icon(Icons.navigate_next,color: Colors.white,)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(onTap: () {
                        Navigator.pop(context);
                        TextEditingController name=TextEditingController(text: state.CurrentRoom?.name);
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
                              child: Container(
                                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Change Topic',style: StyleTitleWN,),
                                          Spacer(),
                                          InkWell(onTap: () {
                                            final myBloc = BlocProvider.of<RoomBloc>(context);
                                            myBloc.add(ChangeRoomnameEvent(name: name.text));
                                          },child: Text('Save',style: StyleTitle.copyWith(fontSize: 18),)),
                                        ],
                                      ) ,
                                      SizedBox(height: 10,),
                                      Container(color: BackgroundGray.withOpacity(0.1),
                                        child: TextFormField(controller: name,
                                          style: StyleTitleWN,


                                        ),
                                      ),
                                      SizedBox(height: 25,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                        child: Row(
                          children: [
                            Text('Topic',style: StyleTitleWN.copyWith(fontSize: 12)),
                            Spacer(),
                            Icon(Icons.navigate_next,color: Colors.white,)
                          ],
                        ),
                      ), SizedBox(height: 10,),
                      InkWell(onTap: () {
                        Navigator.pop(context);
                        TextEditingController describe=TextEditingController(text: state.CurrentRoom?.describe);
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
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Change Announcement',style: StyleTitleWN,),
                                              Spacer(),
                                              InkWell(onTap: () {
                                                final myBloc = BlocProvider.of<RoomBloc>(context);
                                                myBloc.add(ChangeRoomdescripeEvent(name: describe.text));

                                              },child: Text('Save',style: StyleTitle.copyWith(fontSize: 18),)),
                                            ],
                                          ) ,
                                          SizedBox(height: 10,),
                                          Container(color: BackgroundGray.withOpacity(0.1),
                                            child: TextFormField(controller: describe,
                                              style: StyleTitleWN,


                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                        child: Row(
                          children: [
                            Text('Announcement',style: StyleTitleWN.copyWith(fontSize: 12)),
                            Spacer(),
                            Icon(Icons.navigate_next,color: Colors.white,)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(onTap: () {
                        Navigator.pop(context);
                        final myBloc = BlocProvider.of<RoomBloc>(context);

                        myBloc.add(GetKickedMemberRoomEvent());
                        RoomKickedMembersButtomSheet(context);
                      },
                        child: Row(
                          children: [
                            Text('Kicked Users',style: StyleTitleWN.copyWith(fontSize: 12)),
                            Spacer(),
                            Icon(Icons.navigate_next,color: Colors.white,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

              ],
            ),
    );
  },
),


        ),
      );
    },
  );
}