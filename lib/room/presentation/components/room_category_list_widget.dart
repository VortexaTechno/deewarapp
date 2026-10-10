import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/styles.dart';
class RoomCategoryList extends StatelessWidget {
  const RoomCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RoomBloc, RoomState>(
      buildWhen:(previous, current) => previous.GetConstState!= current.GetConstState ,
      builder: (context, state) {
    return Container( width: SizeConfig.screenWidth,height:22 ,child: ListView(scrollDirection:Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(state.RoomCategory.length, (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(onTap: () {
            print(SelectedRoomCategory);
          },
            child: Container(  decoration: BoxDecoration( border: Border.all(color: Colors.black12), color: SelectedRoomCategory==state.RoomCategory[index].id?MainColor.withOpacity(0.2) :Colors.white ,borderRadius: BorderRadius.circular(5) ),child: Center(child: Padding(
              padding:   EdgeInsets.symmetric(horizontal:index==0?20: 10),
              child: Row(
                children: [
                  if(state.RoomCategory[index].flag!=null)   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(height: 20,width: 20,decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: ExactAssetImage(                state.RoomCategory[index].flag??'',package:countryCodePackageName )) ),

                    ),
                  ),

                  SizedBox(width: 5,),
                  Text(state.RoomCategory[index].transtitle??'',style:SelectedRoomCategory==state.RoomCategory[index].id?StyleTitle: StyleTitleBN.copyWith(fontSize: 12 ),),

                ],
              ),
            )),),
          ),
        ))

    ) );
  },
);
  }
}
