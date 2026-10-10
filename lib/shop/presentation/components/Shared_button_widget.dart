
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  Function onClickAction;
  String Buttontittle;
  double ?Fontsize;
  double high;
  Color ?colors;
  bool showgradiant;
  SharedButton({Key? key,required this.onClickAction,required this.Buttontittle,this.Fontsize,this.high=40.0,this.colors,this.showgradiant=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: ()=>onClickAction(),
        child: Container(
          decoration: BoxDecoration(
              gradient:!showgradiant?null: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  MainColor,
                  MainColor,
                  Colors.blue,
                ],
              ),
              color: colors?? Color(0xFF1878f3).withOpacity(0.8) ,
              borderRadius: BorderRadius.circular(25)),

          height:high,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(Buttontittle,
                  style: StyleTitleW.copyWith(fontSize: Fontsize),


                ),
              )),
        ),
      );

  }
}
