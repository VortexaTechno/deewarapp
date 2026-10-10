import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/recharge/presentation/components/search_exchange_history_widget.dart';
import 'package:ahlachat/recharge/presentation/components/search_recharge_history_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
class IncomeHistoryScrean extends StatelessWidget {
  const IncomeHistoryScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(tittle: 'Transaction Details',showpop: true,),
      body: DefaultTabController(
        length: 2,
        child: Column(
        children:   [
          Container(height: 50,color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TabBar(isScrollable: true,
                  indicatorColor: MainColor,
                  tabs:[Tab(
                    text:getLang(context: context, key: "Recharge"),
                  ),Tab(
                    text:getLang(context: context, key: "Exchange"),
                  ),
                  ] ,
                  labelColor: Colors.black,labelStyle:StyleTitle.copyWith(fontSize: 12,fontWeight: FontWeight.w500) ,
                  indicator: MaterialIndicator(
                    height: 5,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 10,color: MainColor,
                    tabPosition: TabPosition.bottom,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: TabBarView(children: [
              SearchHistoryRechargeWidget(),
              SearchHistoryExchangeWidget(),
            ],),
          )
        ]),
      )
    );
  }
}
