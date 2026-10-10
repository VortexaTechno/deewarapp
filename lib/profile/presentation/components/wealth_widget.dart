import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/data/models/levelModel.dart';
import 'package:ahlachat/profile/presentation/components/my_level_icon_widget.dart';
import 'package:ahlachat/profile/presentation/components/progress_line_widget.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WealthWidget extends StatelessWidget {
  const WealthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    CustomScrollView(
      slivers: [
      SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
        buildWhen: (previous, current) => previous.UserProfile?.donate!=current.UserProfile?.donate,
  builder: (context, state) {
     CheckLevelModel mylevel= WealthLevel.where((element) => element.Amount!<=(state.UserProfile?.donate??0)).last;
     var nextlevellevel= (WealthLevel.where((element) => element.Amount!<=(state.UserProfile?.donate??0)).last.Level?.round()??0)+1;
     var total=WealthLevel.where((element) => element.Level==nextlevellevel).first.Amount;
     var remender=(total??0)-(state.UserProfile?.donate??0);
    return InkWell(onTap: () => print(mylevel),child: Container(height:180, child:Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40,),
         Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: CachedNetworkImageProvider(state.UserProfile?.image??''),radius: 25),
             Text(state.UserProfile?.name??'',style: StyleTitleW,) ,
             WealthIconWidget(donate:state.UserProfile?.donate??0 ,hight: 35,)
           ],
         ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              ProgressLine(sum:remender,total:total??0 ,color:Colors.white, ),
              SizedBox(height: 5,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('lv ${mylevel.Level.toString()}',style: StyleTitleVip.copyWith(fontSize: 12,fontWeight: FontWeight.bold),),
                  Text('lv ${nextlevellevel.toString()}',style: StyleTitleVip.copyWith(fontSize: 12,fontWeight: FontWeight.bold)),
                ],
              ),
              Text('To the next level need ${remender.toString()} experience points',style: StyleTitleVip.copyWith(fontSize: 12,fontWeight: FontWeight.normal),),

            ],
          ),
        ),
      ],
    ),decoration: BoxDecoration(color: Colors.red,image: DecorationImage(image: ExactAssetImage(Images.wealth_icon_level),fit: BoxFit.cover))));
  },
),),

      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text('Level description',style: StyleTitleW,),
            SizedBox(height: 15,),
            Text('When send 1 gold coin gift of will increase 1 wealth experience point. As your level upgrade, the color of your level icon will change accordingly.',style: StyleTitleW,textAlign: TextAlign.start),
            SizedBox(height: 15,),
          ],
        ),
      )),
      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(30)),child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MyProfileBloc, MyProfileState>(
            buildWhen: (previous, current) =>previous.GetlevelState!= current.GetlevelState,
            builder: (context, state) {
              return Table(
                  border: TableBorder.all(color: Colors.transparent,borderRadius: BorderRadius.circular(20)), // Allows to add a border decoration around your table
                  children:List.generate(state.wealth.length+1, (index) {

                    return    TableRow(decoration: BoxDecoration(color: index%2==0?Color(0xFF151537):Color(0xFF18183a),borderRadius:index+1!=0?null: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),children :[
                      index==0? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Center(child: Text('Level',style: StyleTitleVip.copyWith(color: Color(0xFFfbf5ff),))),
                      ):
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Center(child: Text('${state.wealth[index-1].startlevel} -  ${state.wealth[index-1].endlevel}',style: StyleTitleVip.copyWith(color: Color(0xFFfbf5ff)),)),
                      ),
                      index==0? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Center(child: Text('icon',style: StyleTitleVip.copyWith(color: Color(0xFFfbf5ff),))),
                      ):
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Center(child:CachedNetworkImage(imageUrl: state.wealth[index-1].icon??'',height: 20,)),
                      ),
                    ]);

                  }


                  )
              );
            },
          ),
        )),
      ),),

    ],);
  }
}
