import 'package:ahlachat/chairs/presentation/components/chair_room_widget.dart';
import 'package:ahlachat/chairs/presentation/components/unset_chair_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChairRoomWidget extends StatelessWidget {
  const ChairRoomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState>(
   builder: (context, state) {
    print('Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair Chair ');

    return GridView.count( padding: EdgeInsets.only(top: 0),shrinkWrap: true ,cacheExtent: 15.6,physics: NeverScrollableScrollPhysics(),
      crossAxisCount:5,
      childAspectRatio :0.7,
      crossAxisSpacing:0.0,
      mainAxisSpacing:0.0,
      children: List.generate(state.CurrentRoom?.roomChairs?.length??0, (index) {
        return  Center(
          child:
          Stack(alignment: Alignment.center,
            children: [
              if(state.CurrentRoom?.roomChairs?[index].hostId!=null)
                Align(alignment: Alignment.center,child: Chairwidget(index:  index)),
               if(state.CurrentRoom?.roomChairs?[index].hostId==null)
                 Align(alignment: Alignment.center,child: ChairEmptyLockwidget(index:index )),

            ],
          ),
        );

      }

      ),);
  },
);
  }
}
