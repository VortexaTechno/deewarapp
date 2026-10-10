import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasesWidget extends StatelessWidget {
  const PurchasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width:   5),
          Image.asset(Images.Coins,height: 18),
          SizedBox(width:   5),
          BlocBuilder<UserloginBloc, UserloginState>(
            buildWhen: (previous, current) =>
            previous.UserProfile?.coin != current.UserProfile?.coin,
            builder: (context, state) {
              return Text(state.UserProfile?.coin.toString()??'',style: StyleTitleWN.copyWith(fontSize: 12));
            },
          ),
          SizedBox(width:   30),
          SharedButton(Buttontittle:getLang( context: context, key: "Bye"),high: 30,Fontsize: 12,onClickAction: (){

          },),
          SizedBox(width:   5),
        ],
      ),
    ),decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(25),color: Colors.white.withOpacity(0.5)),);
    ;
  }
}
