import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/copy_id_widget.dart';
import 'package:ahlachat/profile/presentation/components/my_level_icon_widget.dart';
import 'package:ahlachat/profile/presentation/components/user_frame_size1.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/player.dart';

class RoomUserProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        return Container(decoration:   BoxDecoration(color: Colors.white,borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
          width: SizeConfig.screenWidth!,
          child:
          Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20,),
              InkWell(onTap: () {
                final myBloc = BlocProvider.of<UserProfileBloc>(context);
                myBloc.add(GetUserProfileEvent(User: state.Profile));
              },
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(onTap: () {

                       final myBloc = BlocProvider.of<UserProfileBloc>(context);
                       myBloc.add(GetUserProfileEvent(User:state.Profile));
                    },
                      child: UserFrameWidget1(UserProfile:state.Profile),
                    ),
                    SizedBox(height: 5,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.Profile?.name ?? '', style: StyleTitleB),
                        SizedBox(width: 5,),
                        Image.asset(state.Profile?.sex=='0'?Images.male_ic:Images.femal_ic,height: 15,)
                      ],
                    ),
                    SizedBox(height: 5,),
                    CopyIdWidget(ID: state.Profile?.bId ?? state.Profile?.nId ?? ''),
                    SizedBox(height: 5,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WealthIconWidget(donate:state.Profile?.donate??0 ,hight: 16,),
                        IncomeIconWidget(Income:state.Profile?.gInput??0 ,hight: 16,),
                      ],
                    ),
                    SizedBox(height: 14),
                    Container(width: SizeConfig.screenWidth,color: Colors.transparent,height: 40,child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Expanded(child: Container(height: 40,child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Images.icon_huili,height: 25),
                              SizedBox(width: 5,),
                              Text('ارسال هديه',style: StyleTitleW.copyWith(fontSize: 15)),
                            ],
                          ),decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.male_bg),fit: BoxFit.fill)),)),
                          SizedBox(width: 10,),
                         if(state.Profile?.followstatus==false) Expanded(child: InkWell(
                           onTap: () {
                             print('asdasdasdasd');
                             final myBloc = BlocProvider.of<UserProfileBloc>(context);
                             myBloc.add(ChangeFollowStatusProfileEvent(status: true,));

                             final myBloc2 = BlocProvider.of<UserloginBloc>(context);
                             myBloc2.add(FollowUserEvent(id: state.Profile?.id??0));

                           },
                           child: Container(height: 40,child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Images.icon_follow,height: 25,),
                                SizedBox(width: 5,),
                                Text('متابعه',style: StyleTitleW.copyWith(fontSize: 15),),

                              ],
                            ),decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.female_bg),fit: BoxFit.fill)),),
                         )),
                      SizedBox(width: 10,),
                          Expanded(child: Container(height: 40, child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
        Image.asset(Images.icon_msg,height: 25),
                            SizedBox(width: 5,),
                            Text('دردشه',style: StyleTitleW.copyWith(fontSize: 15)),
        ],
        ),decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.all_),fit: BoxFit.fill)),))

                        ],
                      ),
                    ),)

                  ],
                ),
              ),

              const SizedBox(height: 25,),
            ],
          ),


        );
      },
    );
  }
}