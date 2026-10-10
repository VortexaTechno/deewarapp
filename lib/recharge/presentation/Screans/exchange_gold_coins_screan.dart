import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/recharge/presentation/controller/recharge_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeGoldCoinsScrean extends StatelessWidget {
 
TextEditingController InputController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(tittle: 'Exchange gold coins',showpop: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                         children: [
                           Image.asset(Images.Coins,height: 30,),
                           SizedBox(height: 10,),
                           BlocBuilder<UserloginBloc, UserloginState>(
                             buildWhen: (previous, current) =>
                             previous.UserProfile?.coin != current.UserProfile?.coin,
                             builder: (context, state) {
                               return Text(state.UserProfile?.coin.toString()??"",style:TextStyle(color: Colors.red));
                             },
                           ),
                           SizedBox(height: 10,),
                           Text('Balance',style: StyleTitleG.copyWith(fontWeight: FontWeight.normal,fontSize: 12),)

                         ],
                        ),
                        Column(
                          children: [
                            Image.asset(Images.diamond,height: 30,),
                            SizedBox(height: 10,),
                            BlocBuilder<UserloginBloc, UserloginState>(
                              buildWhen: (previous, current) =>
                              previous.UserProfile?.input != current.UserProfile?.input,
                              builder: (context, state) {
                                return Text(state.UserProfile?.input.toString()??"",style:TextStyle(color: Colors.red));
                              },
                            ),
                            SizedBox(height: 10,),
                            Text('Balance',style: StyleTitleG.copyWith(fontWeight: FontWeight.normal,fontSize: 12),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Images.Coins,height: 30,),
                  SizedBox(width:  10,),
                  Icon(Icons.currency_exchange,color: Colors.black.withOpacity(0.2),),
                  SizedBox(width:  10,),
                  Image.asset(Images.diamond,height: 30,),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                child: Container(child: CustomeTextField(Controller: InputController,type: TextInputType.number,onChanged:(value){
                  final myBloc = BlocProvider.of<RechargeBloc>(context);

                  if(value==''||value=='0'){
                   myBloc.add(ChangeInputEvent(value: int.parse('0')));
                  }else{
                     myBloc.add(ChangeInputEvent(value: int.parse(double.parse(value).floor().toString())));
                  }


                  
                } , hint: 'Please enter the exchange amount',hintColor: Colors.black.withOpacity(0.2),)),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text('Diamonds can be exchanged for gold coins, the total exchange ratio: 10 diamonds = 10 gold coins, the number of diamonds must be an integral multiple of 10.',style: StyleTitleG,),
                    SizedBox(height: 30,),
                   BlocBuilder<RechargeBloc, RechargeState>(
                     buildWhen: (previous, current) =>previous.InputValue!=current.InputValue ,
  builder: (context, state) {

    return BlocBuilder<UserloginBloc, UserloginState>(
      buildWhen: (previous, current) =>previous.UserProfile?.input!=current.UserProfile?.input,

  builder: (context, userstate) {
    return InkWell(onTap: () {
      if(state.InputValue<(userstate.UserProfile?.input??0)&&state.InputValue!=0){
        final myBloc = BlocProvider.of<RechargeBloc>(context);
        myBloc.add(ExchangeDiamondEvent());
        InputController.clear();
      }

    },
      child: Container(
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: state.InputValue<(userstate.UserProfile?.input??0)&&state.InputValue!=0?MainColor:Colors.black.withOpacity(0.1)),
                       height: 50,
                       child: Center(
                         child: Text('Confirm exchange',style: TextStyle(color:state.InputValue<(userstate.UserProfile?.input??0)&&state.InputValue!=0?Colors.white: Colors.black.withOpacity(0.5))),
                       ),
                     ),
    );
  },
);
  },
)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
