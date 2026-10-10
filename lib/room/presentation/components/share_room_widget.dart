
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void ShowShareButtomSheet(context)async{
  final myBloc = BlocProvider.of<MyProfileBloc>(context);
  myBloc.add(GetFansEvent());
  myBloc.add(GetMyFriendsEvent());

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
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          width: SizeConfig.screenWidth,

          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.password,color: Colors.grey,),
              Text('قم بدعوه اصدقائك',style: StyleTitleB.copyWith(fontSize: 22),),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 InkWell(onTap: () async{
                   String Link= await generateProductDynamicLink(roomid:RoomId??'');
                   print(Link);
                   Share.share(Link, subject: 'Room  Invitation');
                   Navigator.pop(context);
                 },child: Image.asset(Images.whatsapp_h,height: 50)),
                  InkWell(onTap: () async{
                    String Link= await generateProductDynamicLink(roomid:RoomId??'');
                    print(Link);
                    Share.share(Link, subject: 'Room  Invitation');
                    Navigator.pop(context);
                  },child: Image.asset(Images.ins_h,height: 50)),
                  InkWell(onTap: () async{
                    String Link= await generateProductDynamicLink(roomid:RoomId??'');
                    print(Link);
                    Share.share(Link, subject: 'Room  Invitation');
                    Navigator.pop(context);
                  },child: Image.asset(Images.facebook_h,height: 50)),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child:DefaultTabController(
                  length: 2,
                  child: Container(
                    color: Colors.white,
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(height: 50,
                          child: TabBar(
                              indicator: MaterialIndicator(
                                color:MainColor,
                                height: 5,
                                topLeftRadius: 0,
                                topRightRadius: 0,
                                bottomLeftRadius: 5,
                                horizontalPadding: 60,
                                bottomRightRadius: 5,
                                tabPosition: TabPosition.bottom,
                              ),
                              isScrollable: false,

                              labelStyle: StyleTitleB.copyWith(height: 1,fontSize: 13),
                              unselectedLabelColor: Colors.black45,
                              labelColor: Colors.black,
                              onTap: (val){   },

                              tabs:   [
                                Tab(
                                  text: getLang(context: context, key: "Fans") ,
                                ),
                                Tab(
                                  text:  getLang(context: context, key: "Friends") ,
                                ),


                              ]
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [

                              Container( width: 100,color: Colors.white,child: BlocBuilder<MyProfileBloc, MyProfileState>(
                                builder: (context, state) {
                                  return ListView.builder(itemCount:state.Fans.length,itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        UserSideInfo(UserData: state.Fans[index],),
                                        Spacer(),
                                        InkWell( onTap: () {
                                           final myBloc = BlocProvider.of<RoomBloc>(context);

                                        myBloc.add(InviteuserRoomEvent(id: state.Fans[index].id??0,Roomid:int.parse(RoomId!) ));
                                        },
                                          child: Container(decoration: BoxDecoration(color: MainColor,borderRadius:BorderRadius.circular(10)),child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(getLang(context: context,key: "Share"),style: StyleTitleW),
                                          ),),
                                        )
                                      ],
                                    ),
                                  ));
                                },
                              ),),
                              Container( width: 100,color: Colors.white,child: BlocBuilder<MyProfileBloc, MyProfileState>(
                                builder: (context, state) {
                                  return ListView.builder(itemCount:state.Friends.length,itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        UserSideInfo(UserData: state.Friends[index],),
                                        Spacer(),
                                        InkWell( onTap: () {
                                          final myBloc = BlocProvider.of<RoomBloc>(context);
                                          myBloc.add(InviteuserRoomEvent(id: state.Friends[index].id??0,Roomid:int.parse(RoomId!) ));
                                        },
                                          child: Container(decoration: BoxDecoration(color: MainColor,borderRadius:BorderRadius.circular(10)),child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(getLang(context: context,key: "Share"),style: StyleTitleW),
                                          ),),
                                        )

                                      ],
                                    ),
                                  ));
                                },
                              ),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
       SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GraySharedButton(onClickAction: (){
                   Navigator.pop(context);
                 },Buttontittle: 'الغاء',),
               ),
              SizedBox(height: 20,),

            ],
          ),


        ),
      );
    },
  );
}