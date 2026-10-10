import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/room/presentation/Screans/popular_rooms_screan.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class MainRoomScrean extends StatefulWidget {
  MainRoomScrean({Key? key}) : super(key: key);

  @override
  State<MainRoomScrean> createState() => _MainRoomScreanState();
}

class _MainRoomScreanState extends State<MainRoomScrean> with SingleTickerProviderStateMixin{


  TabController? Tabcontroller;
  @override
  void initState() {


    Tabcontroller = TabController(vsync: this, length:2,initialIndex: 1);

    Tabcontroller?.addListener((){
      print( Tabcontroller?.index);
      if(Tabcontroller?.index==2){

      }else if(Tabcontroller?.index==0){


      }else if(Tabcontroller?.index==3){


      }

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(backgroundColor: Colors.transparent,appBar: AppBar(elevation: 0,backgroundColor: Colors.white,titleSpacing: 0,automaticallyImplyLeading: false,
        title:  Builder(
            builder: (context) {
              return Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Expanded(
                    child: TabBar(

                  indicator: MaterialIndicator(
                      color: Colors.black,
                      height: 5,
                      topLeftRadius: 0,
                      topRightRadius: 0,
                      bottomLeftRadius: 5,
                      horizontalPadding: 20,
                      bottomRightRadius: 5,
                      tabPosition: TabPosition.bottom,
                    ),
                        isScrollable: true,
                        controller: Tabcontroller,
                        labelStyle: StyleTitle.copyWith(height: 1,fontSize: 16),
                        unselectedLabelColor: Colors.black45,
                        labelColor: Colors.black,
                        onTap: (val){   },

                        tabs:   [
                          Tab(
                            text: getLang(context: context, key: "Fans") ,
                          ),
                          Tab(
                            text:  getLang(context: context, key: "Trind") ,
                          ),


                        ]
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(Images.search,height: 25),
                        onPressed: (){

                        }

                      ),

                      IconButton(
                        icon: Image.asset(Images.leaderboard,height: 25),
                        onPressed: (){



                        },
                      ),
                    ],
                  ),
                ],
              );
            }
        ),
      ),
        body: TabBarView(controller:  Tabcontroller,
          children: [

            Container(),
            PopularRoomsScrean(),
          ],
        ),
      ),

    );
  }

}
