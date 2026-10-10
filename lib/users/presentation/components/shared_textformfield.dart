
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/presentation/components/select_country_code.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeTextField extends StatelessWidget {
  String ? hint;
  bool ?obscureText;
  TextEditingController ?Controller;
  final TextInputType? type;
  final bool ?enable;
  final Widget ?SideWidget;
  final Function ?onClickAction;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final int? maxLength;
  final double? radius;
  final double? hight;
  final Color? bordercolor;
  final Color? fillColor;
  final Color? hintColor;
  final double? hinthight;
  final Color? textColor;
  final Widget? prefxIcon;
  final Widget? suffixicon;
  final VoidCallback ? ontap;
  CustomeTextField({
    this.suffixicon,
    this.hint,
    this.obscureText=false,
    this.Controller,
    this.enable,
    this.onClickAction,
    this.onSaved,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.radius,
    this.hinthight,
    this.hight,
    this.bordercolor,
    this.fillColor,
    this.hintColor,
    this.textColor,
    this.prefxIcon,
    this.type,
    this.ontap,
  this.SideWidget=const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: TextFormColor),width:SizeConfig.screenWidth,child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(SideWidget!=null)SideWidget! ,

          BlocBuilder<UserloginBloc, UserloginState>(
            builder: (context, state) {
    return Expanded(
            child: TextFormField(    onChanged: onChanged,enabled:enable??true,controller: Controller,obscureText:obscureText==false?false:!state.ShowPassword,
              cursorColor: Colors.black,keyboardType:type,
              decoration: InputDecoration( suffixIcon: suffixicon,  isDense: true,
                suffixIconColor: Colors.black,
                focusedBorder:bordercolor==null?OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),

                ): OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: MainColor, width: 1.0),
                ),
                enabledBorder: bordercolor==null?OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                ): OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black45, width: 1.0),
                ),
                  hintText:hint,

                  hintStyle: TextStyle(color:hintColor?? Colors.black26,fontSize: hinthight??14),
                
                suffix:obscureText==false?  null: InkWell(onTap: () {

                  final myBloc = BlocProvider.of<UserloginBloc>(context);
                  myBloc.add(ChangeVisibility(Visibility: !state.ShowPassword));
                },child: Icon(!state.ShowPassword?Icons.visibility_off_outlined:Icons.visibility_outlined,color: Colors.black12)),



              ),
            ),
          );
  },
),
          if(type==TextInputType.phone)

            Container(height: 40,width: 1,color:Colors.black12),
          if(type==TextInputType.phone) CountryCodePhone(ShowCode: false,)
        ],
      ),
    ),);
  }
}