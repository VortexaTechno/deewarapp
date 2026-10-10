import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/profile/presentation/components/my_level_icon_widget.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/userprofile/presentation/components/FollowProfileTabBarWidget.dart';
import 'package:ahlachat/userprofile/presentation/components/add_image_profile_screan.dart';
import 'package:ahlachat/userprofile/presentation/components/profile_view_widget.dart';
import 'package:ahlachat/userprofile/presentation/components/show_image_profile.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../core/utils/styles.dart';
class UserProfileScrean extends StatefulWidget {

  @override
  State<UserProfileScrean> createState() => _UserProfileScreanState();
}

class _UserProfileScreanState extends State<UserProfileScrean> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:     DefaultTabController(
            length: 2,
            child: CustomScrollView(
              slivers: [

                SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(child: ProfileView()),
                            Container(height: 30, color: Colors.white),
                          ],
                        ),
                        Positioned(bottom: 0,
                            left: 20,
                            child: BlocBuilder<UserProfileBloc, UserProfileState>(
                              buildWhen: (previous, current) =>
                              previous.Profile?.image != current.Profile?.image,
                              builder: (context, state) {
                                return CircleAvatar(
                                  radius: 38,
                                  backgroundImage: CachedNetworkImageProvider(
                                      state.Profile?.image ?? ''),);
                              },
                            ))
                      ],
                    )
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<UserProfileBloc, UserProfileState>(
                    buildWhen: (previous, current) =>previous.Profile?.image!= current.Profile?.image,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:  15,),
                            Row(
                              children: [
                                Text(state.Profile?.name??'',style: StyleTitleB),
                                SizedBox(width: 10,),
                                Image.asset(state.Profile?.sex=='0'?Images.male_ic:Images.femal_ic,height: 15),


                              ],
                            ),
                            SizedBox(height:  15,),
                            InkWell(onTap: () => print( state.Profile?.flag),
                              child: Row(
                                children: [
                                  Image.asset(
                                    state.Profile?.flag??'',
                                    package: countryCodePackageName,
                                    width: 25,
                                  ),
                                  SizedBox(width:  5,),
                                  Text( state.Profile?.country??'',style: StyleTitleG.copyWith(fontWeight: FontWeight.normal),),
                                  SizedBox(width: 10,),
                                  Text( '|',style: StyleTitleG.copyWith(fontWeight: FontWeight.normal,color: Colors.grey.withOpacity(0.3),fontSize: 20),),
                                  SizedBox(width: 10,),
                                  Text( 'ID: '+ (state.Profile?.bId??state.Profile?.nId??''),style: StyleTitleB.copyWith(fontWeight: FontWeight.normal,fontSize: 12),),
                                  SizedBox(width: 5,),
                                  InkWell(onTap: () {
                                    Clipboard.setData(ClipboardData(text:state.Profile?.bId??state.Profile?.nId??'' ));
                                    Showtoast(message: getLang(context: context, key: "Copied"));
                                  },

                                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius:BorderRadius.circular(5) ),child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: Text( 'copy',style: StyleTitleG.copyWith(fontWeight: FontWeight.normal,color: Colors.grey.withOpacity(0.3),fontSize: 10),),
                                    )),
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height:  15,),
                            Row(
                              children: [
                                WealthIconWidget(donate:state.Profile?.donate??0 ,hight: 22,),
                                IncomeIconWidget(Income: state.Profile?.gInput??0 ,hight: 22,),
                              if(state.Profile?.CurrentVip!=null) Container(width: 50,height: 50,child: SVGASimpleImage(resUrl:  state.Profile?.CurrentVip?.vip?.medal??''))

                              ],
                            ),

                            SizedBox(height:  20,),
                            FollowProfileTabBarWidget(UserData: state.Profile),
                            SizedBox(height:  20,),
                            Text(state.Profile?.descript ??getLang(context: context,key: "Description"),style: StyleTitleBN.copyWith(color: Colors.black54,fontSize: 13)),
                            SizedBox(height:  15,),
                          ]
                        ),
                      );
                    },
                  ),
                ),

                SliverToBoxAdapter(child: Container(
                  width: SizeConfig.screenWidth,
                  height: 10,
                  color: BackgroundGray,
                ),),
                SliverToBoxAdapter(child:

                Container(
                  width: SizeConfig.screenWidth,
                  height: 100,
                  color: Colors.white,
                  child: BlocBuilder<UserProfileBloc, UserProfileState>(
                    buildWhen: (previous, current) =>previous.Profile?.ProfileImage!= current.Profile?.ProfileImage,
  builder: (context, state) {
    return ListView.builder(scrollDirection: Axis.horizontal,itemCount:state.Profile?.medals?.length==0?1: state.Profile?.medals?.length,itemBuilder: (context, index) =>

        Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state.Profile?.medals?.length==0?  InkWell(
                      onTap: (){
                        final myBloc = BlocProvider.of<MyProfileBloc>(context);
                        myBloc.add(GetMedalEvent());
                      },
                      child: Container(child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(Images.ic_room_exception,fit: BoxFit.fill),
                      ),
                        height: 70,width: 90,
                        decoration: BoxDecoration(color: BackgroundGray,borderRadius: BorderRadius.circular(20)),
                      ),
                    ):

                    InkWell(onTap: () {
                      ShowModelDetales(Model: (state.Profile?.medals![index])! );
                    },
                      child: Container(child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CachedNetworkImage(imageUrl:state.Profile?.medals![index].image??'' ,fit: BoxFit.cover),
                      ),
                        height: 70,width: 80,
                        decoration: BoxDecoration(color: BackgroundGray,borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
    );
  },
),
                ),),
                SliverToBoxAdapter(child: Container(
                  width: SizeConfig.screenWidth,
                  height: 10,
                  color: BackgroundGray,
                ),),


    new SliverFillRemaining(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(   isScrollable: true,labelColor: Colors.black,labelStyle: StyleTitleB,
              unselectedLabelStyle:StyleTitle.copyWith( ) ,
              indicator: MaterialIndicator(
                height: 5,
                topLeftRadius: 8,
                topRightRadius: 8,horizontalPadding: 10.0,
                color: Colors.blue,
              ),
              tabs:[
                Tab(
                  text: 'Data',
                ),
                Tab(
                  text: 'Moment',
                )
              ]),
          Expanded(
            child: TabBarView(
            children: <Widget>[
       SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 20,),
              Container(
                width: SizeConfig.screenWidth,
                height: 90,
                color: Colors.white,
                child: BlocBuilder<UserProfileBloc, UserProfileState>(
                 // buildWhen: (previous, current) =>previous.Profile?.ProfileImage!= current.Profile?.ProfileImage,
                  builder: (context, state) {
                    return ListView.builder(scrollDirection: Axis.horizontal,itemCount:(state.Profile?.ProfileImage?.length??0)+1 ,itemBuilder: (context, index) {
                      if(index==0){

                        if(state.Profile?.id.toString()==UserId){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                NavigateTo(context: context, screen: AddImageProfileScrean());
                              },
                              child: Container(
                                child: Container(height: 30, width: 80,child: Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Image.asset(Images.ic_image ),
                                )),
                                decoration: BoxDecoration(  color: BackgroundGray,borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          );
                        }
                        return SizedBox();

                      }else{
                        return      InkWell(onTap: () {
                          NavigateTo(context: context, screen: ImageViewProfile(ProfileImage:state.Profile?.ProfileImage,photoindex:index-1 ,));

                        },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider(state.Profile?.ProfileImage![index-1].image??''),fit: BoxFit.fill),color: BackgroundGray,borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        );
                      }
                    }





                    );
                  },
                ),
              ),
           ],
         ),
       ),
            Text("Tab 2"),

            ],
            ),
          ),
        ],
      ),
    ),)
              ],
            ),
          )



      ),
    );
  }
}


class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}
