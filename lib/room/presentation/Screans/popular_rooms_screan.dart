import 'package:ahlachat/room/presentation/components/image_room_slider_widget.dart';
import 'package:ahlachat/room/presentation/components/room_veiw_widget.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PopularRoomsScrean extends StatelessWidget {
  const PopularRoomsScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoomBloc, RoomState>(
      buildWhen: (previous, current) => previous.GetRoomsState!=current.GetRoomsState||previous.CheckRoomsState!=current.CheckRoomsState,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: ImageRoomSlide(),),
                SliverPadding(padding: EdgeInsets.symmetric(vertical: 3)),

                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(onTap: () {


                    }, child: RoomViewWidget(  Info: state.Rooms[index],));
                  },
                    childCount: state.Rooms.length,
                  ),
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
