
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/shop/data/models/PackageModel.dart';
import 'package:ahlachat/shop/data/models/SalesPackageModel.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class VerticalTapBar extends StatelessWidget {
  PackageModel  Packages;
  VerticalTapBar({required this.Packages});
  @override
  Widget build(BuildContext context) {
    return VerticalTabs(contentScrollAxis: Axis.vertical,
      tabsWidth: 100,backgroundColor: TextFormColor,
      selectedTabBackgroundColor:  TextFormColor,
      tabBackgroundColor: Colors.white,
      indicatorColor: Colors.white,
      tabsElevation: 0.0,
      tabs:List.generate(Packages.category?.length??0, (index) =>   Tab(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child: Text(Packages.category![index].name??'',style: StyleTitle.copyWith(fontSize: 14),),
      )),),



      contents: List.generate(Packages.category?.length??0, (index) =>   Tab(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child:GridView.builder(  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20)  , itemCount:Packages.category![index].items?.length??0 ,itemBuilder: (BuildContext ctx, itemindex) {
          return InkWell( onTap: () {
            print(Packages.category![index].items![itemindex].id);
            final myBloc = BlocProvider.of<ShopBloc>(context);
            myBloc.add(SelectItemEvent(Item: Packages.category![index].items![itemindex]));
          },
            child:   BlocBuilder<ShopBloc, ShopState>(
  builder: (context, state) {

    print(state.SelectedItem?.id);
    return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color:state.SelectedItem?.id==Packages.category![index].items![itemindex].id?MainColor: Colors.transparent),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CachedNetworkImage(imageUrl: Packages.category![index].items![itemindex].image??'',height: 88),

                  Text( Packages.category![index].items![itemindex].name??'',style: StyleTitleB,),

                  Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('7 Days',style: StyleTitleBN.copyWith(fontSize: 12)),
                      Text(' / ',style: StyleTitleBN.copyWith(fontSize: 12)),

                      Image.asset(Images.Coins,height: 13),
                      SizedBox(width:5),
                      Text(Packages.category![index].items![itemindex].price.toString(),style: StyleTitleBN.copyWith(fontSize: 12)),
                    ],),

                ],
              ),
            );
  },
),
          );
        }),),
      )),


    );
  }
}


class  MineVerticalTapBar extends StatelessWidget {
  SalesPackageModel  Packages;
  MineVerticalTapBar({required this.Packages});
  @override
  Widget build(BuildContext context) {
    return VerticalTabs(contentScrollAxis: Axis.vertical,
      tabsWidth: 100,backgroundColor: TextFormColor,
      selectedTabBackgroundColor:  TextFormColor,
      tabBackgroundColor: Colors.white,
      indicatorColor: Colors.white,
      tabsElevation: 0.0,
      tabs:List.generate(Packages.category?.length??0, (index) =>   Tab(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child: Text(Packages.category![index].name??'',style: StyleTitle.copyWith(fontSize: 14),),
      )),),



      contents: List.generate(Packages.category?.length??0, (index) =>   Tab(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child:GridView.builder(  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20)  , itemCount:Packages.category![index].sales?.length??0 ,itemBuilder: (BuildContext ctx, itemindex) {
          return BlocBuilder<ShopBloc, ShopState>(
            builder: (context, state) {


              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                     color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     CachedNetworkImage(imageUrl: Packages.category![index].sales![itemindex].items?.image??'',height: 88),
                     Text( Packages.category![index].sales![itemindex].items?.name??'',style: StyleTitleB,),
                    BlocBuilder<UserloginBloc, UserloginState>(
                      buildWhen: (previous, current) =>
                      previous.UserProfile?.Frame != current.UserProfile?.Frame||  previous.UserProfile?.Entry != current.UserProfile?.Entry,
                    builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:SharedButton(high: 30,onClickAction: (){
                        print(state.UserProfile?.Frame?.id);
                        print(state.UserProfile?.Entry?.id);
                        print(Packages.category![index].sales![itemindex].id);
                        print(state.UserProfile?.Frame?.id==Packages.category![index].sales![itemindex].id||state.UserProfile?.Entry?.id==Packages.category![index].sales![itemindex].id);
                        final myBloc = BlocProvider.of<ShopBloc>(context);
                        if(state.UserProfile?.Frame?.id==Packages.category![index].sales![itemindex].id||state.UserProfile?.Entry?.id==Packages.category![index].sales![itemindex].id){
                          print('Removeeeeeeee');
                          myBloc.add(UnWearItemEvent(sales:Packages.category![index].sales![itemindex] ,));
                         }
                         else{
                          myBloc.add(WearItemEvent(sales:Packages.category![index].sales![itemindex] ,));
                         }

                       },Buttontittle:state.UserProfile?.Frame?.id==Packages.category![index].sales![itemindex].id||state.UserProfile?.Entry?.id==Packages.category![index].sales![itemindex].id? 'Remove':'Wear'),
                      );
  },
),
                     Text('${CountLeftDays(Create:Packages.category![index].sales![itemindex].createdAt??'',days:Packages.category![index].sales![itemindex].days??0 )} Days Left',style: StyleTitleG.copyWith(fontSize: 12)),



                  ],
                ),
              );
            },
          );
        }),),
      )),


    );
  }
}

