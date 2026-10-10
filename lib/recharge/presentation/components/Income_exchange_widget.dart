import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/recharge/presentation/Screans/exchange_gold_coins_screan.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExchangeWidget extends StatelessWidget {
  const IncomeExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:Container( height: 150,width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text('Diamond Balance',style: StyleTitleWN.copyWith(fontSize: 20),),
                  BlocBuilder<UserloginBloc, UserloginState>(
            buildWhen: (previous, current) =>previous.UserProfile?.input!=current.UserProfile?.input,
  builder: (context, state) {
    return Text(state.UserProfile?.input.toString()??'',style: StyleTitleW.copyWith(fontSize: 30));
  },
),
                  SizedBox(height: 1,),
                ],
              ),
            ),
            decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ic_withdraw_bg),fit: BoxFit.cover)),
          ),
        ),
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 200,),
              Text('Diamond Can be Exchanged for gold coins',style: StyleTitleG.copyWith(fontSize: 14),textAlign: TextAlign.center, ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SharedButton(onClickAction: (){
                  NavigateTo(context: context, screen: ExchangeGoldCoinsScrean());
                }, Buttontittle: 'Exchange gold coins',high: 50,Fontsize: 12,showgradiant: false,colors: MainColor),
              ),
              SizedBox(height: 100,),
            ],
          ),
        ),),

      ],
    );
  }
}
