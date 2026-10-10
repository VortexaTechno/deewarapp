import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/leaderboard/presentation/controller/leaderboard_bloc.dart';
import 'package:ahlachat/profile/presentation/components/my_level_icon_widget.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void RankRoomButtomSheet(context)async{
  final myBloc = BlocProvider.of<LeaderboardBloc>(context);
  myBloc.add(GetLeaderboardDayleEvent( ));

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
        padding: const EdgeInsets.only(top: 150),
        child:RoomRankScrean(),
      );
    },
  );
}

class RoomRankScrean extends StatefulWidget {
  const RoomRankScrean({Key? key}) : super(key: key);

  @override
  State<RoomRankScrean> createState() => _RoomRankScreanState();
}

class _RoomRankScreanState extends State<RoomRankScrean> {
  TabController? Tabcontroller;

  @override
  void initState() {


    Tabcontroller = TabController(vsync: thiscontext, length:2,initialIndex:0);

    Tabcontroller?.addListener((){

      if(Tabcontroller?.index==1){


          final myBloc = BlocProvider.of<LeaderboardBloc>(context);
          if(myBloc.state.WeekRoomLeaderboard.isEmpty){
            myBloc.add(GetLeaderboardWeekEvent( ));

          }


      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
      width: SizeConfig.screenWidth,

      child: BlocBuilder<RoomBloc, RoomState>(

        builder: (context, state) {
           return Column(mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height:4,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.clear,color: Colors.white,),
                    Text('الترتيب',style: StyleTitleB.copyWith(fontSize: 17),),
                    InkWell(onTap: () => Navigator.pop(context),child: Icon(Icons.clear,color: Colors.grey,)),

                  ],
                ),
              ),
              SizedBox(height: 5,),



              DefaultTabController(length: 2,child: Expanded(child: Column(children: [
                Container(height: 40,color:Colors.white,width: SizeConfig.screenWidth,child: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  tabs:[
                    Tab(
                      text:"اليومي",
                    ),
                    Tab(
                      text:"الاسبوعي",
                    ),

                  ] ,
                  labelColor: Colors.black,labelStyle:StyleTitleB.copyWith(fontSize: 14,fontWeight: FontWeight.normal) ,
                  indicator: MaterialIndicator(
                    height: 4,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 40,color:MainColor,
                    tabPosition: TabPosition.bottom,
                  ),
                  controller: Tabcontroller,
                ),),
                Expanded(
                  child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
  builder: (context, state) {
    return TabBarView( controller: Tabcontroller,children: [
      if(state.DayleRoomLeaderboard.isNotEmpty)          Column(
        mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Last Update : ${ConvertTimeToday(Time: DateTime.now().toLocal().toString())}',style: StyleTitleG),
                        ),
                        SizedBox(height: 10,),
                        InkWell(onTap: () {
                          final myBloc = BlocProvider.of<UserProfileBloc>(context);
                          myBloc.add(GetUserProfileEvent(User:state.DayleRoomLeaderboard.first.sender));
                        },
                          child: Stack(children: [
                            Padding(padding: EdgeInsets.only(top: 30),child: Align(alignment: Alignment.center,child: CircleAvatar(radius: 27,backgroundImage: CachedNetworkImageProvider( state.DayleRoomLeaderboard.first.sender?.image??''),))),

                            Align(alignment: Alignment.center,child: Image.asset(Images.ic_ranking_room_headet,height: 100)),
                          ], ),
                        ),
                        SizedBox(height: 10,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text( state.DayleRoomLeaderboard.first.sender?.name??'',style: StyleTitleBN),
                                SizedBox(width: 5,),
                                if( state.DayleRoomLeaderboard.first.sender?.sex=='0')Image.asset(Images.femal_ic,height: 15,)

                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WealthIconWidget(donate: state.DayleRoomLeaderboard.first.sender?.donate??0 ,hight: 18,),
                                IncomeIconWidget(Income: state.DayleRoomLeaderboard.first.sender?.gInput??0 ,hight: 18,),
                              ],
                            ),


                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [


                            Text(  k_m_b_generator(state.DayleRoomLeaderboard.first.coins) ,style: StyleTitleB.copyWith(height: 1,fontSize: 12)),
                            SizedBox(width:   5),
                            Image.asset(Images.Coins,height: 15),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(child: ListView.separated(separatorBuilder: (context, index) => Container(height: 1,width: SizeConfig.screenWidth,color: Colors.black12),itemCount: state.DayleRoomLeaderboard.skip(1).length,itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text((index+2).toString(),style: StyleTitle),
                                  SizedBox(width:   10),
                                  UserSideInfo(UserData: state.DayleRoomLeaderboard.skip(1).toList()[index].sender),
                                  Spacer(),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [


                                 Text(  k_m_b_generator(state.DayleRoomLeaderboard.skip(1).toList()[index].coins) ,style: StyleTitleB.copyWith(height: 1,fontSize: 12)),
                                      SizedBox(width:   5),
                                      Image.asset(Images.Coins,height: 18),

                                    ],
                                  ),
                                ],
                              ),
                            ),)),
                          ),
                        ),
                      ],
                    ),

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Last Update : ${ConvertTimeToday(Time: DateTime.now().toLocal().toString())}',style: StyleTitleG),
          ),
          SizedBox(height: 10,),
          if(state.WeekRoomLeaderboard.isNotEmpty)       InkWell(
            onTap: () {
              final myBloc = BlocProvider.of<UserProfileBloc>(context);
              myBloc.add(GetUserProfileEvent(User:state.WeekRoomLeaderboard.first.sender));
            },
            child: Stack(children: [
              Padding(padding: EdgeInsets.only(top: 30),child: Align(alignment: Alignment.center,child: CircleAvatar(radius: 27,backgroundImage: CachedNetworkImageProvider( state.WeekRoomLeaderboard.first.sender?.image??''),))),

              Align(alignment: Alignment.center,child: Image.asset(Images.ic_ranking_room_headet,height: 100)),
            ], ),
          ),

          SizedBox(height: 10,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text( state.WeekRoomLeaderboard.first.sender?.name??'',style: StyleTitleBN),
                  SizedBox(width: 5,),
                  if( state.WeekRoomLeaderboard.first.sender?.sex=='0')Image.asset(Images.femal_ic,height: 15,)

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WealthIconWidget(donate: state.WeekRoomLeaderboard.first.sender?.donate??0 ,hight: 18,),
                  IncomeIconWidget(Income: state.WeekRoomLeaderboard.first.sender?.gInput??0 ,hight: 18,),
                ],
              ),


            ],
          ),
          SizedBox(height: 5,),
          Row(        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [


              Text(  k_m_b_generator(state.DayleRoomLeaderboard.first.coins) ,style: StyleTitleB.copyWith(height: 1,fontSize: 12)),
              SizedBox(width:   5),
              Image.asset(Images.Coins,height: 15),

            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: ListView.separated(separatorBuilder: (context, index) => Container(height: 1,width: SizeConfig.screenWidth,color: Colors.black12),itemCount: state.WeekRoomLeaderboard.skip(1).length,itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text((index+2).toString(),style: StyleTitle),
                    SizedBox(width:   10),
                    UserSideInfo(UserData: state.WeekRoomLeaderboard.skip(1).toList()[index].sender),
                    Spacer(),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [


                        Text( k_m_b_generator(state.WeekRoomLeaderboard.skip(1).toList()[index].coins)  ,style: StyleTitleB.copyWith(height: 1,fontSize: 12)),
                        SizedBox(width:   5),
                        Image.asset(Images.Coins,height: 18),

                      ],
                    ),
                  ],
                ),
              ),)),
            ),
          ),
        ],
      ),
                  ]);
  },
),
                )
              ],))),



            ],
          );
        },
      ),


    );
  }
}
