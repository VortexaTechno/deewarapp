import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/components/user_side_info_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void RoomMembersButtomSheet(context,num)async{
 TextEditingController SearchController=  TextEditingController();
  JoinNextPage=1;

  showModalBottomSheet(isScrollControlled: true,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
    ),
    builder: (context) {

      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          width: SizeConfig.screenWidth,

          child: Column(mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height:4,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    InkWell(onTap: () {
                      JoinNextPage=1;
  final myBloc = BlocProvider.of<RoomBloc>(context);

  myBloc.add(GetJoinMemberRoomEvent());
                    },child: Icon(Icons.refresh,color: Colors.grey,)),
                    Text(' ${num.toString()}: مستخدم متصل  ',style: StyleTitleB.copyWith(fontSize: 17),),
                    InkWell(onTap: () => Navigator.pop(context),child: Icon(Icons.clear,color: Colors.grey,)),

                  ],
                ),
              ),
              Container(width: SizeConfig.screenWidth,height: 1,color: Colors.white.withOpacity(0.2),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container (height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: BackgroundGray
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: SearchController,
                        onEditingComplete: (){
                        final myBloc = BlocProvider.of<RoomBloc>(context);

                        myBloc.add(SearchMmeberRoomEvent(tittle: SearchController.text));

                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: BackgroundGray,
                          hintText: getLang(context: context,key: 'Search'),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),)
                    ),
                  ),
                ),
              ),
              SizedBox(height:10,),
              ListOfMemberJoined(),





            ],
          )


        ),
      );
    },
  );
}

class ListOfMemberJoined extends StatelessWidget {
 
  ScrollController? _controller= ScrollController();

  @override
  Widget build(BuildContext context) {
    void _scrollListener() {

      final myBloc = BlocProvider.of<RoomBloc>(context);


      if((_controller?.offset??0) >= (_controller?.position.maxScrollExtent??0)-20 &&(_controller?.offset??0) <= 230&& !myBloc.state.MemperPaginateState){
       print('myBlock Pagination for join member room ');
print(_controller?.offset);
       myBloc.add(GetJoinMemberRoomEvent());

      }
    }
    _controller?.addListener(_scrollListener);
    return BlocBuilder<RoomBloc, RoomState>(
  builder: (context, state) {
    return Expanded(child:ListView.separated(
        physics: BouncingScrollPhysics(),
        controller:_controller ,
        separatorBuilder: (context, index) =>

            Container(width: SizeConfig.screenWidth,height: 1,color: Colors.grey.withOpacity(0.2),),

        itemBuilder: (context, index)
        {  
        return     Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 12),
          child: UserSideInfo(
              UserData: state.JoindUsers[index]),
        );
        }, itemCount: state.JoindUsers.length));
  },
);
  }
}


