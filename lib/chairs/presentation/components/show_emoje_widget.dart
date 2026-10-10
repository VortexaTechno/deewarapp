import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void ShowEmojeButtomSheet(context)async{


  showModalBottomSheet(isScrollControlled: false,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
    ),
    builder: (context) {
      return Container(
        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(0)),
        width: SizeConfig.screenWidth,
height: 250,
        child: BlocBuilder<RoomBloc, RoomState>(
          buildWhen: (previous, current) => previous.CurrentRoom!=current.CurrentRoom,

  builder: (context, state) {
    print('EditRoomBloc  EditRoomBlocEditRoomBlocEditRoomBlocEditRoomBloc CurrentRoom');
    return EmojeWidget();
  },
),


      );
    },
  );
}

class EmojeWidget extends StatefulWidget {

  @override
  State<EmojeWidget> createState() => _EmojeWidgetState();
}

class _EmojeWidgetState extends State<EmojeWidget> with SingleTickerProviderStateMixin{
  TabController? Tabcontroller;

  @override
  void initState() {


    Tabcontroller = TabController(vsync: this, length:JoinChairId!=null?2:1,initialIndex:0);

    Tabcontroller?.addListener((){
      print( Tabcontroller?.index);
      if(Tabcontroller?.index==1){
        final myBloc = BlocProvider.of<ChairBloc>(context);
        if(myBloc.state.EmojeAsset.isEmpty){
          myBloc.add(GetEmojeEvent());

        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: JoinChairId!=null?2:1,
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [


          Expanded(
            child: TabBarView(controller: Tabcontroller,
              children: [
              Container(child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Images.sticker_dice,height: 80,),
                    Image.asset(Images.sticker_mora_2,height: 80,),
                    Image.asset(Images.sticker_countdown,height: 80,),
                    Image.asset(Images.sticker_pump_mic,height: 80,),
                  ],
                ),
              ),),
       if(JoinChairId!=null)       BlocBuilder<ChairBloc, ChairState>(
  builder: (context, state) {
    return GridView.builder(
           gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:4,
        childAspectRatio:0.8,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5),
           itemCount:state.EmojeAsset.length ,
           itemBuilder: (BuildContext ctx, indexx) {
             return InkWell(onTap: (){
               final myBloc = BlocProvider.of<ChairBloc>(context);

               myBloc.add(SendEmojeEvent(tittle: state.EmojeAsset[indexx].assets??''));
             Navigator.pop(context);
             },
          child: CachedNetworkImage(imageUrl:AppConstance.imageEmojeUrl(state.EmojeAsset[indexx].assets??'' )  ,height: 50,)
             );
           });
  },
)

            ],), 
          ),

          Container(height: 50,color: Colors.transparent,
            child: TabBar(isScrollable: false,controller: Tabcontroller,
              indicatorColor: Colors.white,
              tabs:[Tab(
                child: Image.asset(Images.sticker_dice),
              ),

                if(JoinChairId!=null)      Tab(
                child: Image.asset(Images.Tears_of_Joy),
              ),

              ] ,
              labelColor: Colors.black,labelStyle:StyleTitle.copyWith(fontSize: 12,fontWeight: FontWeight.w500) ,
              indicator: MaterialIndicator(
                height: 1,
                topLeftRadius: 8,
                topRightRadius: 8,
                horizontalPadding: 50,color: Colors.white,
                tabPosition: TabPosition.bottom,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
