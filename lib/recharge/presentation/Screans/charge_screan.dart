import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/recharge/presentation/Screans/income_history_screan.dart';
import 'package:ahlachat/recharge/presentation/components/Income_exchange_widget.dart';
import 'package:ahlachat/recharge/presentation/components/charge_package_widget.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
class ChargeScrean extends StatelessWidget {
  const ChargeScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:DefaultTabController(
        length: 2,

        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(height: 80,color: Colors.white,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  InkWell(onTap: () => Navigator.pop(context),child: Icon(Icons.navigate_before,size: 30)),
                  Expanded(
                    child: TabBar(
                      indicatorColor: MainColor,padding: EdgeInsets.symmetric(horizontal: 50),
                      tabs:[Tab(
                        text:getLang(context: context, key: "Coins"),
                      ),Tab(
                        text:getLang(context: context, key: "income"),
                      ),
                      ] ,
                      labelColor: Colors.black,labelStyle:StyleTitle.copyWith(fontSize: 20,fontWeight: FontWeight.w500) ,
                      indicator: MaterialIndicator(
                        height: 4,
                        topLeftRadius: 8,
                        topRightRadius: 8,
                        horizontalPadding: 40,color: MainColor,
                        tabPosition: TabPosition.bottom,
                      ),
                    ),
                  ),
                  InkWell(onTap: () => NavigateTo(context: context, screen: IncomeHistoryScrean()),child: Image.asset(Images.ic_wallet,height:25,))
                ],
              ),
            ),),
            Expanded(child:   TabBarView(
                children:[
                  ChargePackageWidget(),
                  IncomeExchangeWidget()
                ]
            ),)
          ],
        ),
      ) ,
    );
  }
}
