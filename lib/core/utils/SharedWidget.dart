import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/copy_id_widget.dart';

import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void NavigateTo({required BuildContext context, required Widget screen}) {
  Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
        screen,
        transitionDuration: Duration(
          milliseconds: 300,
        ),
        transitionsBuilder: (context, animation,
            secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ));
}
void NavigateToReplacement({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
        screen,
        transitionDuration: Duration(
          milliseconds: 300,
        ),
        transitionsBuilder: (context, animation,
            secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ));
}

class UserSharedButton extends StatelessWidget {
    Function onClickAction;
    String Buttontittle;
    UserSharedButton({Key? key,required this.onClickAction,required this.Buttontittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child:InkWell(
        onTap: ()=>onClickAction(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  MainColor,
                  MainColor,
                  Colors.blue,
                ],
              ),
              color:  Color(0xFF1878f3).withOpacity(0.8) ,
              borderRadius: BorderRadius.circular(25)),
          width: SizeConfig.screenWidth!,
          height:  SizeConfig.TenSize!*4.8,
          child: Center(
              child: Text(Buttontittle,
                style: StyleTitleW,


              )),
        ),
      ),
    );
  }
}

class GraySharedButton extends StatelessWidget {
  Function onClickAction;
  String Buttontittle;
  GraySharedButton({Key? key,required this.onClickAction,required this.Buttontittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child:InkWell(
        onTap: ()=>onClickAction(),
        child: Container(
          decoration: BoxDecoration(

              color:  BackgroundGray ,
              borderRadius: BorderRadius.circular(25)),
          width: SizeConfig.screenWidth!,
          height:  SizeConfig.TenSize!*4.8,
          child: Center(
              child: Text(Buttontittle,
                style: StyleTitleB,


              )),
        ),
      ),
    );
  }
}

GBottomSheet({required BuildContext context, ScreanWidget,IsScrollable=false,Opecite=1})
{
  showModalBottomSheet( backgroundColor: Colors.transparent,isScrollControlled: IsScrollable, barrierColor:Colors.black.withOpacity(0.2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30), )),
    context: context,
    builder: (context) {
      return ScreanWidget;
    },
  );}



class OpenBottomSheetAnimate extends StatefulWidget {
  String ?ButtonTitle;
UserModel?UserData;

  OpenBottomSheetAnimate({ required this.ButtonTitle,required this.UserData});
  @override
  State<OpenBottomSheetAnimate> createState() => _OpenBottomSheetAnimateState();
}

class _OpenBottomSheetAnimateState extends State<OpenBottomSheetAnimate>  with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 300,), vsync: this);
    // Animation duration for displaying the BottomSheet
    controller.duration = const Duration(milliseconds: 250,);

    // Animation duration for retracting the BottomSheet
    controller.reverseDuration = const Duration(milliseconds: 400,);
    // Set animation curve duration for the BottomSheet
    controller.drive(CurveTween(curve: Curves.ease));

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap:(){
      showModalBottomSheet(
        elevation: 0.0,
        backgroundColor: Colors.white,
        barrierColor: Colors.black12,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
        ),
         builder: (context) {
          return BlocBuilder<ShopBloc, ShopState>(
  builder: (context, state) {
    return Container(
      decoration: BoxDecoration(color: BackgroundGray,borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(height: 100,width: 100,  decoration: BoxDecoration(border: Border.all(color: MainColor.withOpacity(0.5),width: 2),color: BackgroundGray,borderRadius: BorderRadius.circular(25) ),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(imageUrl: state.SelectedItem?.image??'',),
                      )),
                      SizedBox(width: 10,),
                      Column(mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(state.SelectedItem?.name??'',style: StyleTitleB.copyWith(fontSize: 22)),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("TO:  ${widget.UserData?.name?? ''}",style: StyleTitleBN.copyWith(fontSize: 15)),
                              SizedBox(width: 5,),
                              CopyIdWidget(ID: widget.UserData?.bId ?? widget.UserData?.nId ?? ''),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),

                    ],
                  ),
                  SizedBox(height: 20),
                  Container(child:  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('7 Days / ',style: StyleTitle.copyWith(fontSize: 15)),
                          Image.asset(Images.Coins,height: 16),
                          SizedBox(width:5),
                          Text(state.SelectedItem?.price.toString()??'',style: StyleTitle.copyWith(fontSize: 15)),
                        ],),
                      SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(onTap: () {

                          final myBloc = BlocProvider.of<ShopBloc>(context);
                          myBloc.add(SendItemEvent(id: widget.UserData?.id));
                          Navigator.pop(context);
                        },child: Container(width: 100,height: 35,child: Center(child: Text(getLang( context: context,key: "Send"),style: StyleTitleW.copyWith(fontSize: 12))),decoration: BoxDecoration(color: MainColor,borderRadius: BorderRadius.circular(20)),)),
                       InkWell(onTap: () => Navigator.pop(context),child: Container(width: 100,height: 35,child: Center(child: Text(getLang( context: context,key: "Close"),style: StyleTitle.copyWith(fontSize: 12))),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),))
                      ]),
                      SizedBox(height: 10,)
                    ],
                  ), decoration: BoxDecoration( borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))),),

                ],
              ),
            ),
          );
  },
);
        },
      );
    },
      child: Container(
        child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Text(widget.ButtonTitle??'',style: StyleTitleWN.copyWith(fontSize: 13),),
        )),
        decoration: BoxDecoration(
            color: MainColor,
            borderRadius: BorderRadius.circular(25)
        ),
      ),
    );
  }
}
