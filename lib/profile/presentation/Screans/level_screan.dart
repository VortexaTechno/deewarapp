import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/income_level_widget.dart';
import 'package:ahlachat/profile/presentation/components/wealth_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
class MyLevelScrean extends StatelessWidget {
  const MyLevelScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: VipBackground,
      appBar: CustomeAppBar(showpop: true,tittle: 'My Level',),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(height: 50,color: Color(0xFF333357),width: SizeConfig.screenWidth,child: TabBar(
              indicatorColor: Color(0xFFfbf5ff),padding: EdgeInsets.symmetric(horizontal: 50),
              tabs:[Tab(
                text:"Wealth Level",
              ),Tab(
                text:"Income Level",
              ),
              ] ,
              labelColor: Color(0xFFfbf5ff),labelStyle:TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal) ,
              indicator: MaterialIndicator(
                height: 4,
                topLeftRadius: 8,
                topRightRadius: 8,
                horizontalPadding: 40,color:Color(0xFFfbf5ff),
                tabPosition: TabPosition.bottom,
              ),
            ),),
            Expanded(
              child: TabBarView(children: [
                WealthWidget(),
                IncomeWidget(),
              ]),
            )
          ],
        ),
      ),

    );
  }
}
