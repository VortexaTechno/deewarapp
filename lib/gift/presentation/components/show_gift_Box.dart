import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/gift/presentation/controller/gift_bloc.dart';
import 'package:ahlachat/room/data/models/ChairModel.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spring/spring.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class GiftBoxWidget extends StatelessWidget {

List choices=['asd','asddasd'];
  final SpringController springController =
  SpringController(initialAnim: Motion.play);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  SizedBox(width: 5),
                  Image.asset(Images.Coins, height: 18),
                  SizedBox(width: 5),
                  BlocBuilder<UserloginBloc, UserloginState>(
                    buildWhen: (previous, current) =>
                    previous.UserProfile?.coin != current.UserProfile?.coin,
                    builder: (context, state) {
                      return Text(state.UserProfile?.coin.toString() ?? '',
                          style: StyleTitleWN.copyWith(fontSize: 12));
                    },
                  ),
                  SizedBox(width: 30),
                ],
              ),

              SharedButton(Buttontittle: getLang(context: context, key: "Bye"),
                high: 30, colors: Color(0xFF555555),
                Fontsize: 12,showgradiant: false,
                onClickAction: () {

                },),

            ],
          ),
        ),
        SizedBox(height: 5,),
        BlocBuilder<GiftBloc, GiftState>(
          builder: (context, state) {
            return Expanded(
              child: DefaultTabController(length: state.Gifts.length, child: Column(
                children: [ 
                  Container( width: SizeConfig.screenWidth,
                    child: TabBar(
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white54,
                        isScrollable: true,automaticIndicatorColorAdjustment: true,
                        indicatorSize: TabBarIndicatorSize.label,
                       indicator: MaterialIndicator(
                height: 3,
                topLeftRadius: 0,
                topRightRadius: 0,
                bottomLeftRadius: 5 ,
                bottomRightRadius: 5,color: Colors.white,
                tabPosition: TabPosition.bottom,
              ),

                        tabs: List.generate(state.Gifts.length, (index) =>   Tab(
                          child: Text(state.Gifts[index].transname??'',style: TextStyle(fontSize: 13)),
                        ),)
                    ),
                  ),
                   SizedBox(height: 15,),
                   Expanded (
                    child: Container(
                      child: TabBarView(children:
                      List.generate(state.Gifts.length, (index) =>
                          GridView.builder(scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:0.9,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),

                              itemCount:state.Gifts[index].gift?.length ,
                              itemBuilder: (BuildContext ctx, indexx) {
                                return InkWell(onTap: (){

                                  final myBloc = BlocProvider.of<GiftBloc>(context);

                                  myBloc.add(SelectGiftEvent(Gift: state.Gifts[index].gift![indexx]));
                                },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:state.SelectedGift?.id== state.Gifts[index].gift![indexx].id?Color(0xFF555555):Colors.transparent,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10),
                                         if(state.SelectedGift?.id== state.Gifts[index].gift![indexx].id)         Spring.bubbleButton(
                                              springController: springController,
                                              animDuration: Duration(seconds: 5),child: Container(height: 60,width: 80,color: Colors.transparent,child: CachedNetworkImage(imageUrl: state.Gifts[index].gift![indexx].image??'',fit: BoxFit.fill))),
                                          if(state.SelectedGift?.id!= state.Gifts[index].gift![indexx].id)           Container(height: 60,width: 80,color: Colors.transparent,child: CachedNetworkImage(imageUrl: state.Gifts[index].gift![indexx].image??'',fit: BoxFit.fill) ),

                                          SizedBox(height: 5),
                                          Text(state.Gifts[index].gift![indexx].transname??'',style: StyleTitle.copyWith(fontSize: 14,color: Color(0xFFfebe00))),
                                          SizedBox(height: 5),

                                          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Image.asset(Images.Coins, height: 12),
                                              SizedBox(width: 5),
                                              Text(state.Gifts[index].gift![indexx].price.toString() ,
                                                  style: StyleTitleWN.copyWith(fontSize: 12)),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                );
                              }),
                      )
                      ),
                    ),
                  ),
                ],
              ),),
            );
          },
        ),
        Container(height: 50,color: Colors.transparent,child:               Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [

              SizedBox(width: 10),
              BlocBuilder<GiftBloc, GiftState>(
                buildWhen: (previous, current) => previous.SelectedUser!=current.SelectedUser,
  builder: (context, state) {
    return PopupMenuButton(padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Color(0xFF555555),
                elevation: 3.2,
                initialValue: state.SelectedUser,
                child: Container(width: 150,height: 50,decoration: BoxDecoration(color:Color(0xFF555555),borderRadius: BorderRadius.circular(20) ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(radius: 15,backgroundImage: CachedNetworkImageProvider(state.SelectedUser?.image??'')),
                     Text(state.SelectedUser?.name??'',style: StyleTitleW,),
                    Icon(Icons.arrow_drop_down,color: Colors.white,)
                  ],
                )),
                onCanceled: () {

                },
                tooltip: 'This is tooltip',
                onSelected: (  c){
                  print(c);
          

                },
                itemBuilder: (BuildContext context) {
                  final myBloc = BlocProvider.of<ChairBloc>(context);

                  return myBloc.state.ChairhHosts.map((UserModel choice) {
                    return PopupMenuItem(padding: EdgeInsets.all(0),

                  onTap: () {
                     final myBloc = BlocProvider.of<GiftBloc>(context);

                    myBloc.add(SelectUserEvent(User: choice));
                  },
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          CircleAvatar(radius: 15,backgroundImage: CachedNetworkImageProvider(choice.image??'')),
                          SizedBox(width: 5),
                          Text(choice.name??'',style: StyleTitleW,),

                        ],

                      ),

                    );
                  }).toList();
                },
              );
  },
),
              SizedBox(width: 10),
              BlocBuilder<GiftBloc, GiftState>(
                buildWhen: (previous, current) => previous.SelectedNum!=current.SelectedNum,
  builder: (context, state) {
    return PopupMenuButton(padding: EdgeInsets.all(0),
                elevation: 3.2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Color(0xFF555555),
                initialValue: state.SelectedNum  ,
                child: Container(width: 80,height: 50,decoration: BoxDecoration(color:Color(0xFF555555),borderRadius: BorderRadius.circular(27) ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.SelectedNum??'' ,style: StyleTitleW,),
                        Icon(Icons.arrow_drop_down,color: Colors.white,)
                      ],
                    )),
                onCanceled: () {
                  print('You have not chossed anything');
                },
                tooltip: 'This is tooltip',
                onSelected: (c){},
                itemBuilder: (BuildContext context) {
                  return GiftCount.map(( choice) {
                    return PopupMenuItem(
                      padding: EdgeInsets.all(0),
                    onTap: () {
                      final myBloc = BlocProvider.of<GiftBloc>(context);

                      myBloc.add(SelectNumEvent(Num:   choice));
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(choice,style: StyleTitleW),
                            Spacer(),
                            Icon(Icons.arrow_drop_down,color: Colors.white,)
                          ],
                        ),
                      ),
                    );
                  }).toList();
                },
              );
  },
),
              Spacer(),
              BlocBuilder<GiftBloc, GiftState>(
  builder: (context, state) {
    return SharedButton(Buttontittle: getLang(context: context, key: "Send"),
                high: 60, colors: Color(0xFF555555),
                Fontsize: 14,showgradiant: false,
                onClickAction: () {

      if(state.SelectedGift!=null){
        final myBloc = BlocProvider.of<UserloginBloc>(context);
        var total = myBloc.state.UserProfile?.coin?? 0;
        if(int.parse(state.SelectedNum??'0')*int.parse(state.SelectedGift?.price??'0')>total){
          Showtoast(message: getLang(context: context,key: "not_have_enough"));
        }else{
          final myBloc = BlocProvider.of<GiftBloc>(context);

          myBloc.add(SendGiftEvent());
Navigator.pop(context);


        }
      }




                },);
  },
),
              SizedBox(width: 10),

            ],
          ),
        ),)


      ],
    );
  }
}


void ShowGiftButtomSheet(context) async {
  final myBloc = BlocProvider.of<ChairBloc>(context);

    myBloc.add(CollectChairHostEvent());
  showModalBottomSheet(isScrollControlled: false,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25))
    ),
    builder: (context) {
      return Container(
          decoration: BoxDecoration(
              color:Color(0xFF212121), borderRadius: BorderRadius.circular(0)),
          width: SizeConfig.screenWidth,

          child: GiftBoxWidget()

      );
    },
  );
}