import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/recharge/presentation/controller/recharge_bloc.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchHistoryRechargeWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 25,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async{

                  final myBloc = BlocProvider.of<RechargeBloc>(context);


                  myBloc.add(SelectDateSearch());
                },
                child: Container(
                  decoration: BoxDecoration(color: BackgroundGray,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                  child: Row(
                    children: [
                      BlocBuilder<RechargeBloc, RechargeState>(
                        buildWhen: (previous, current) => previous.SelectedDate!=current.SelectedDate,
  builder: (context, state) {
    return Text(state.SelectedDate??ConvertTimeToday(Time: DateTime.now().toLocal().toString()),style: StyleTitleB);
  },
),
                      Icon(Icons.arrow_drop_down,color: Colors.black,)
                    ],
                  ),
                ),),
              ),
              SharedButton(onClickAction: (){
                final myBloc = BlocProvider.of<RechargeBloc>(context);


                myBloc.add(SearchRecharge());

              }, Buttontittle: 'Search',high: 25,Fontsize: 12,showgradiant: false,colors: MainColor)

            ],
          ),
          SizedBox(height: 25,),
          BlocBuilder<RechargeBloc, RechargeState>(
            buildWhen: (previous, current) => previous.RechargeHistoryStatus!=current.RechargeHistoryStatus,
  builder: (context, state) {
    return Column(
            children:List.generate(state.RechargeHistory.length, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
              child: Container(color: Colors.white,
                width: SizeConfig.screenWidth,
                height: 70,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(width: 60,height: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: ExactAssetImage(Images.logo))),),
               SizedBox(width: 10,),
                Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded( 
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Row(
                                  children: [
                                    Image.asset(Images.Coins,height: 17),
                                    SizedBox(width: 10,),
                                    Text(state.RechargeHistory[index].coins.toString(),),

                                  ],
                                ),
                                Spacer(),
                                Text('${state.RechargeHistory[index].cost.toString()}\$',style: StyleTitleBN),
                              ],
                            ),
                          ),
                          Text(ConvertTimeToday(Time: state.RechargeHistory[index].createdAt??''),style: StyleTitleG),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          );
  },
)

        ],
      ),
    );
  }
}
