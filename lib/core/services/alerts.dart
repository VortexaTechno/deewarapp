import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

void Showtoast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: MainColor,
      fontSize: 15.0
  );
}
void showCustomDialog({required BuildContext context, required Btitle,required tittle,final VoidCallback ? ontap }) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Btitle,style: StyleTitleB,),
                  SizedBox(height: 15,),
                  Text(tittle,style: StyleTitleBN,),
                  SizedBox(height: 15,),
                  Container(height: 0.2,color: Colors.black,),
                  SizedBox(height: 15,),
                  Row(children: [
                    Expanded(child: InkWell(onTap: ontap,child: Container(child: Center(child: Text(getLang(context: context,key: "Yes"),style: StyleTitleB,)),))) ,

                    Expanded(child: InkWell(onTap:() => Navigator.pop(context), child:  Container(child: Center(child: Text(getLang(context: context,key: "Cancle"),style: StyleTitleB,)),)))
                  ],)
                ],
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
void showCustomInvitationDialog({required image,required name,required room,required BuildContext context, required Btitle,required tittle,final VoidCallback ? ontap }) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Btitle,style: StyleTitleB,),
                  SizedBox(height: 15,),
                  Text(tittle,style: StyleTitleBN,),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width:   5,),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: CachedNetworkImageProvider(image),),
                          SizedBox(width: 10,),
                          Text(name,style: StyleTitleB,),

                        ],
                      ),
                      Spacer(),
                      Text(room,style: StyleTitleBN,),
                      SizedBox(width: 15,),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Container(height: 0.2,color: Colors.black,),
                  SizedBox(height: 15,),
                  Row(children: [
                    Expanded(child: InkWell(onTap: ontap,child: Container(child: Center(child: Text(getLang(context: context,key: "Yes"),style: StyleTitleB,)),))) ,

                    Expanded(child: InkWell(onTap:() => Navigator.pop(context), child:  Container(child: Center(child: Text(getLang(context: context,key: "Cancle"),style: StyleTitleB,)),)))
                  ],)
                ],
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
void ShowGlopalLoading() {
  SmartDialog.showLoading(msg: 'Loading...',
      builder: (context) {
        return Container(
          height: 110,
          width: 110,
          child: Center(child: Image.asset(
            'assets/image/App/load.gif', height: 50, width: 50,)),
          color: Colors.white,
          alignment: Alignment.center,

        );
      }
  );
}

void DismissGlopalLoading() {
  SmartDialog.dismiss();
}

void showDatePickers(context) {
  FocusScope.of(context).unfocus();
  showCupertinoModalPopup(
      context: context,
      builder: (_) => ShowDatePicer());
}

class ShowDatePicer extends StatelessWidget {

  String ? Date;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Expanded(
            child: Container(

              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumYear: 1950,
                  maximumYear: DateTime
                      .now()
                      .year,
                  onDateTimeChanged: (val) {
                    //  print(val.toIso8601String());
                    print(val.toUtc());
                    //print(val.toLocal());
                    Date = val.toUtc().toString();
                    // setState(() {
                    // user.History =
                    // '${val.month}-${val.day}-${val.year}';
                    // user.day = val.day;
                    // user.year = val.year;
                    // user.month = val.month;
                    // });
                  }),
            ),
          ),
          BlocBuilder<UserloginBloc, UserloginState>(
            buildWhen:(previous, current) => previous.SelectData!=current.SelectData ,
            builder: (context, state) {
              return CupertinoButton(
                child: Text(
                  getLang(context: context, key: "Done"),
                  style: StyleTitle.copyWith(fontSize: 25),
                ),
                onPressed: () {
                  print(Date);
                  final myBloc = BlocProvider.of<UserloginBloc>(context);
                  myBloc.add(SelectData(Selectdata: Date));
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                },
              );
            },
          )
        ],
      ),
    );
  }
}


void showDatePickersProfile(context) {
  FocusScope.of(context).unfocus();
  showCupertinoModalPopup(
      context: context,
      builder: (_) => ShowDatePicerProfile());
}

class ShowDatePicerProfile extends StatelessWidget {

  String ? Date;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Expanded(
            child: Container(

              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumYear: 1950,
                  maximumYear: DateTime
                      .now()
                      .year,
                  onDateTimeChanged: (val) {
                    //  print(val.toIso8601String());
                    print(val.toUtc());
                    //print(val.toLocal());
                    Date = val.toUtc().toString();
                    // setState(() {
                    // user.History =
                    // '${val.month}-${val.day}-${val.year}';
                    // user.day = val.day;
                    // user.year = val.year;
                    // user.month = val.month;
                    // });
                  }),
            ),
          ),
          BlocBuilder<UserloginBloc, UserloginState>(
            buildWhen:(previous, current) => previous.SelectData!=current.SelectData ,
            builder: (context, state) {
              return CupertinoButton(
                child: Text(
                  getLang(context: context, key: "Done"),
                  style: StyleTitle.copyWith(fontSize: 25),
                ),
                onPressed: () {
                  print('DateDateDateDateDateDateDateDateDateDateDateDate');
                  final myBloc = BlocProvider.of<MyProfileBloc>(context);
                  myBloc.add(UpdateProfileEvent(data: Date ));
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                },
              );
            },
          )
        ],
      ),
    );
  }
}