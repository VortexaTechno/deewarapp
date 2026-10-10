import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:ahlachat/vip/data/models/VipSalesModel.dart';
import 'package:ahlachat/vip/data/models/VipTapsModel.dart';
import 'package:ahlachat/vip/presentation/components/VipDialogWidget.dart';
import 'package:ahlachat/vip/presentation/components/VipTapWidget.dart';
import 'package:ahlachat/vip/presentation/controller/vip_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/utils/SizeConfig.dart';

class VipShopScrean extends StatelessWidget {
  const VipShopScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(image: DecorationImage(
      image: ExactAssetImage(Images.vipBack),
      alignment: Alignment.topCenter
    )),
      child: Scaffold(backgroundColor: Colors.transparent,
       appBar: CustomeAppBar(
          tittle: getLang(context: context, key: "Vip_Center"), showpop: true,BC: Colors.transparent,TC: Colors.white),
     body: BlocBuilder<VipBloc, VipState>(
  builder: (context, state) {

    return Container(height: SizeConfig.screenHeight,
      child: DefaultTabController(length: state.VipShopPackages.length,child:
          Column(
            children: [
              TabBar( isScrollable:true,labelColor: Color(0xFFeae2be),
                  indicator: MaterialIndicator(
                    height: 5,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 10,color: Color(0xFFeae2be),
                    tabPosition: TabPosition.bottom,
                  ),
                  tabs:List.generate( state.VipShopPackages.length, (index) => Tab(
                    text: state.VipShopPackages[index].name,
                  ) )),
              Expanded(
                child: TabBarView(
                    children:List.generate( state.VipShopPackages.length, (index){

                 List<VipSalesModel> Checkvip=state.VipSales.where((element) => element.vipId==state.VipShopPackages[index].id).toList();

                     return   Container(height: SizeConfig.screenHeight!,color:Colors.transparent,
                        child: Column(
                          children: [
                            Expanded(
                              child: CustomScrollView(  physics: BouncingScrollPhysics(),
                                slivers: [
                                  SliverToBoxAdapter(child:Container(
                                    height: SizeConfig.screenHeight,
                                    width: SizeConfig.screenWidth,
                                    child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 40,),
                                        Expanded(flex: 1,child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
                                              child: Container(height: 130 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: ExactAssetImage(Images.vipBack2),fit: BoxFit.fill)),width: SizeConfig.screenWidth,child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(height: 150,width: 150,child: SVGASimpleImage(resUrl: state.VipShopPackages[index].medal??'')),
                                                  Container(decoration:BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft:Radius.circular(25) )) ,height: 80,width: 200,child: Row(
                                                    children: [
                                                      Container(height: 130,width: 110,child: SVGASimpleImage(resUrl: state.VipShopPackages[index].frame?.svga??'')),
                                                      BlocBuilder<UserloginBloc, UserloginState>(
                                                       buildWhen: (previous, current) =>  previous.UserProfile?.CurrentVip != current.UserProfile?.CurrentVip,
  builder: (context, userstate) {
    return InkWell(onTap: () {
      print(state.VipShopPackages[index].id);
      print(userstate.UserProfile?.CurrentVip?.vipId);
    },child: Text(userstate.UserProfile?.CurrentVip?.vipId== state.VipShopPackages[index].id?'Active':'Not Active',style:TextStyle(color: Colors.yellow.withOpacity(0.7)) ));
  },
),
                                                    ],
                                                  )),

                                                ],
                                              )),
                                            ),
                                            Align(alignment: Alignment.bottomCenter,child: Container(height: 70,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(Images.vipStar,height: 15),
                                                    SizedBox(width: 10,),
                                                    Text(getLang(context: context, key: "Privileges"),style: TextStyle(fontWeight: FontWeight.w600,height: 1)),
                                                    SizedBox(width: 10,),
                                                    Image.asset(Images.vipStar,height: 15),

                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(color: Colors.transparent,image: DecorationImage(image: ExactAssetImage(Images.vipBack3),fit: BoxFit.fill)),
                                            ),)
                                          ],
                                        )),
                                        Expanded(flex: 3,child: Container(color: Colors.white,child: GridView.count(
                                          mainAxisSpacing: 4,  physics: BouncingScrollPhysics(),
                                          crossAxisCount: 4,children: [
                                           VipTapWidget(tap: VipTapModel(Index:0,Status:state.VipShopPackages[index].frame!=null )),
                                           VipTapWidget(tap: VipTapModel(Index:1,Status:state.VipShopPackages[index].medal!=null )),
                                           VipTapWidget(tap: VipTapModel(Index:2,Status:state.VipShopPackages[index].entry!=null )),
                                           VipTapWidget(tap: VipTapModel(Index:3,Status:state.VipShopPackages[index].nameCard!=null)),
                                           VipTapWidget(tap: VipTapModel(Index:4,Status:state.VipShopPackages[index].fontColor!=null)),
                                           VipTapWidget(tap: VipTapModel(Index:5,Status:state.VipShopPackages[index].exclusiveGift!='0' )),
                                           VipTapWidget(tap: VipTapModel(Index:6,Status:state.VipShopPackages[index].roomEntry!=null )),
                                           VipTapWidget(tap: VipTapModel(Index:7,Status:state.VipShopPackages[index].antiSilence!='0'   )),
                                           VipTapWidget(tap: VipTapModel(Index:8,Status:state.VipShopPackages[index].antiKick!='0' )),
                                            VipTapWidget(tap: VipTapModel(Index:9,Status:state.VipShopPackages[index].specialId!='0')),
                                            VipTapWidget(tap: VipTapModel(Index:10,Status:state.VipShopPackages[index].roomFrame!='0' )),
                                           VipTapWidget(tap: VipTapModel(Index:11,Status:state.VipShopPackages[index].onlineNotic!='0'  )),
                                          VipTapWidget(tap: VipTapModel(Index:12,Status:state.VipShopPackages[index].bonus!='0'  )),

                                        //  VipTapWidget(tap: VipTapModel(Index:4,FImage:'assets/image/vip/v_icon1_F.png' ,Status:state.VipShopPackages[index].fontColor!=null ,TImage:'assets/image/vip/v_icon1_T.png' ,Title:'Font Color' )),

                                        ],)),

                                        ),



                                      ],
                                    ),
                                  ),),

                                ],
                              ),
                            ),
                            Checkvip.isNotEmpty? Container(color: Colors.white,height: 50,child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Left : ${CountLeftDays(Create:state.VipSales.where((element) => element.vipId==state.VipShopPackages[index].id).toList().first.createdAt??'',days:state.VipSales.where((element) => element.vipId==state.VipShopPackages[index].id).toList().first.days??0 )} Days ',style: StyleTitleVip.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
                              
                         BlocBuilder<UserloginBloc, UserloginState>(
                           buildWhen: (previous, current) =>
                           previous.UserProfile?.CurrentVip != current.UserProfile?.CurrentVip,
  builder: (context, userstate) {
 if( Checkvip.first.status==0 ){
   return InkWell(onTap: () {
     final myBloc = BlocProvider.of<VipBloc>(context);
     myBloc.add(UseVipEvent(Sales: Checkvip.first, ));
   },
     child: Container(
       height: 35,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Center(child: Text('use',style: StyleTitleVip,)),
       ),

       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
           gradient: VipGradiant
       ),


     ),
   );
 }
 if(Checkvip.first.vipId==userstate.UserProfile?.CurrentVip?.vip?.id||Checkvip.first.status==1  ){
   return InkWell(onTap: () {
     final myBloc = BlocProvider.of<VipBloc>(context);
     myBloc.add(RemoveVipEvent(Sales: Checkvip.first, ));
   },
     child: Container(
       height: 35,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Center(child: Text('REMOVE',style: StyleTitleVip,)),
       ),

       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
           gradient: VipGradiant
       ),


     ),
   );
 }else{
   return InkWell(onTap: () {
     // final myBloc = BlocProvider.of<VipBloc>(context);
     // myBloc.add(BuyVipEvent(vip:  state.VipShopPackages[index] ));
   },
     child: Container(
       height: 35,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Center(child: Text(getLang( context: context, key: "Bye"),style: StyleTitleVip,)),
       ),

       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
           gradient: VipGradiant
       ),


     ),
   );
 }



  },
),
                              ],
                            )):
                            Container(color: Colors.white,height: 50,child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Buy:💎 ${state.VipShopPackages[index].price.toString()} / ${state.VipShopPackages[index].days.toString()} Days',style: StyleTitleVip.copyWith(fontSize: 13,fontWeight: FontWeight.bold),),

                                InkWell(onTap: () {
                                  final myBloc = BlocProvider.of<VipBloc>(context);
                                  myBloc.add(BuyVipEvent(vip:  state.VipShopPackages[index] ));
                                },
                                  child: Container(
                                    height: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Center(child: Text(getLang( context: context, key: "Bye"),style: StyleTitleVip,)),
                                    ),

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: VipGradiant
                                    ),


                                  ),
                                ),
                              ],
                            )),
                          ],
                        )
                    );
                    }

                    )
                ),
              ),
            ],
          ),
        ),
    );
  },
),

      ),
    );
  }
}
