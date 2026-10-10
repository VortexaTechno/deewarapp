import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChargePackageWidget extends StatelessWidget {
  const ChargePackageWidget({Key? key}) : super(key: key);

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

                Text('Coins Balance',style: StyleTitleWN.copyWith(fontSize: 20),),
                BlocBuilder<UserloginBloc, UserloginState>(
                  buildWhen: (previous, current) =>previous.UserProfile?.coin!=current.UserProfile?.coin,
  builder: (context, state) {
    return Text(state.UserProfile?.coin.toString()??'',style: StyleTitleW.copyWith(fontSize: 30));
  },
),
                SizedBox(height: 1,),
              ],
            ),
          ),
          decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ic_wallet_bg),fit: BoxFit.cover)),
          ),
        ),
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
          child: Text('Recharge',style: StyleTitleBN ),
        ),),
        SliverToBoxAdapter(child: Column(
          children:List.generate(5, (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 25),
            child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Images.Coins,height: 22,),
                      SizedBox(width: 10,),
                      Text('500 Coins',style: StyleTitleBN )
                    ],
                  ),

                  SharedButton(onClickAction: (){}, Buttontittle: '\$40.89',high: 25,Fontsize: 12,showgradiant: false,colors: MainColor)
                ],
              ),
            ),
          )),
        ),)
      ],
    );
  }
}
