
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/mainpage/presentation/controller/main_screan_bloc.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';
import 'package:ahlachat/room/presentation/Screans/main_room_screan.dart';
import 'package:ahlachat/room/presentation/Screans/room_screan.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/roomchat/presentation/Screans/Inbox_room_screan.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

import '../../../profile/presentation/Screans/my_profile_screan.dart';

class MainScrean extends StatelessWidget {
    MainScrean({Key? key}) : super(key: key);
  static  final List<Widget> _widgetOptions = <Widget>[
    MainRoomScrean(),
    MainRoomScrean(),
    InboxRoomScrean(),
    MyProfileScrean(),

  ];
  DateTime? currentBackPressTime;
  bool onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime??DateTime.now()) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Showtoast(message: getLang(context: NavigationService.navigatorKey.currentContext, key: "Tap_Exit"));
      return false;
    } else {
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{

          bool backStatus = onWillPop();
          if (backStatus) {
            SystemNavigator.pop();
          }


        return  false ;
      },
      child: BlocBuilder<RoomBloc, RoomState>(
        buildWhen: (previous, current) => previous.JoinVoiceRoomState!=current.JoinVoiceRoomState||previous.LeaveVoiceRoomState!=current.LeaveVoiceRoomState,
  builder: (context, state) {
print('state.CurrentRoom==nullstate.CurrentRoom==nullstate.CurrentRoom==nullstate.CurrentRoom==nullCurrentRoom==nullstate.CurrentRoom==null');
 print(state.CurrentRoom);
    return FloatingDraggableWidget(

        floatingWidget:state.CurrentRoom==null||state.CurrentRoom==RoomModel()||RoomId==null? SizedBox():FloatingActionButton(
          heroTag: 'lodd',
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: (){},

          tooltip: 'Increment',
          child: InkWell(onTap: () {
            InRoom=true;
              NavigateTo(context: context, screen: RoomScrean());
          },child: Stack(children: [
          Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2),image: DecorationImage(image: CachedNetworkImageProvider(state.CurrentRoom?.image??''),fit: BoxFit.fill),borderRadius: BorderRadius.circular(10),color: MainColor),),

            Align(alignment: Alignment.topLeft,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 15,width: 15,color: Colors.transparent,child: SVGASimpleImage( assetsName: Images.live,)),
            ))

          ], ))
        ),
        floatingWidgetHeight: 80 ,
        floatingWidgetWidth: 80,
        dx: 10,
        dy: SizeConfig.screenHeight!-200,
        speed: 500,
        mainScreenWidget: Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(disabledElevation: 0.0,hoverElevation: 0.0

          ,highlightElevation: 0.0,focusElevation: 0.0,foregroundColor: Colors.transparent,
          focusColor: Colors.transparent,splashColor: Colors.transparent,
           label: InkWell(onTap: () {
            final myBloc = BlocProvider.of<RoomBloc>(context);
            print(myBloc.state.Rooms.length);
            if(myBloc.state.CurrentRoom!=null){
              InRoom=true;
              NavigateTo(context: context, screen: RoomScrean());
            }else{
              myBloc.add(CheckRoomsevent());
            }

          },child:Image.asset(Images.CheckRoom,fit: BoxFit.cover,height: 80,width: 80)),

          backgroundColor: Colors.transparent,

          elevation: 0,
          isExtended: true,hoverColor: MainColor,
          onPressed: (){
            print('sss');
          },
        ),
        body: BlocBuilder<MainScreanBloc, MainScreanState>(

          builder: (context, state) {
             return IndexedStack(
                index: state.selectedIndex,
                children:_widgetOptions
            );
          },
        ),
        bottomNavigationBar:    BlocBuilder<MainScreanBloc, MainScreanState>(
          buildWhen:(previous, current) => previous.selectedIndex!=current.selectedIndex ,
          builder: (context, state) {
            return BottomAppBar(
              child: BottomNavigationBar(
                selectedFontSize: 0,backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,


                selectedLabelStyle: const TextStyle( fontSize: 12,color: Colors.black),

                items:   <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(state.selectedIndex==0?Images.HomeIconSelect:Images.HomeIcon,height:30,width: 30),
                    ),
                    label: getLang( context: context, key: "Home"),
                  ),
                  BottomNavigationBarItem(
                    icon:Image.asset(state.selectedIndex==1?Images.ExploreIconSelect:Images.ExploreIcon,height:30,width: 30),
                    label: getLang( context: context, key: "Explore"),
                  ),
                  BottomNavigationBarItem(
                    icon:Image.asset(state.selectedIndex==2?Images.MessageIconSelect:Images.MessageIcon,height:30,width: 30),
                    label:getLang( context: context, key: "Messages"),
                  ),
                  BottomNavigationBarItem(
                    icon:Image.asset(state.selectedIndex==3?Images.ProfileIconSelect:Images.ProfileIcon,height:30,width: 30),
                    label:getLang( context: context, key: "Profile"),
                  ),


                ],
                currentIndex: state.selectedIndex??0,
                elevation: 0,
                selectedItemColor: Colors.black87,
                showSelectedLabels: true,

                onTap: (index){
                  final myBloc = BlocProvider.of<MainScreanBloc>(context);
                  final myBloc2 = BlocProvider.of<RoomchatBloc>(context);
 if(myBloc2.state.InboxRoomMs.isEmpty&&index==2){
   myBloc2.add(GetInboxRoomEvent() );
 }

                  myBloc.add(ChangeSelectNavIndex(Index:index ));
                },
              ),


            );
          },
        ),
      ),

      );
  },
),
    );
  }
}
