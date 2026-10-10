
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';


class ImageRoomSlide extends StatelessWidget {
  const ImageRoomSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<RoomBloc, RoomState>(
      buildWhen:(previous, current) => previous.GetConstState!= current.GetConstState ,
  builder: (context, state) {
    if(state.GetConstState==RequestState.loading){
      return SizedBox();
    }
    return ImageSlideshow(

      width: double.infinity,
      height: 130,
      initialPage: 0,
      indicatorColor: Colors.transparent,

      indicatorBackgroundColor:Colors.transparent,
      children:state.Banners.length==0?[]:List.generate(state.Banners.length, (index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(    borderRadius: BorderRadius.circular((6)),
            child:  CachedNetworkImage(
                imageUrl:state.Banners[index].image??'',fit: BoxFit.fill)),
      )),
      onPageChanged: (value) {


      },
      autoPlayInterval: 3000,
      isLoop: true,
    );
  },
);
  }
}

class ImageRoomSlide2 extends StatefulWidget {
  @override
  _ImageRoomSlide2State createState() => _ImageRoomSlide2State();
}

class _ImageRoomSlide2State extends State<ImageRoomSlide2> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RoomBloc, RoomState>(
        buildWhen:(previous, current) => previous.GetConstState!= current.GetConstState ,
        builder: (context, state) {
          if (state.GetConstState == RequestState.loading) {
            return SizedBox();
          }
          return ImageSlideshow(

            width: double.infinity,
            height: 110,
            initialPage: 0,
            indicatorColor: Colors.transparent,

            indicatorBackgroundColor:Colors.transparent,
            children:state.BackBanners.length==0?[]:List.generate(state.BackBanners.length, (index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(    borderRadius: BorderRadius.circular((5)),
                  child:  CachedNetworkImage(
                      imageUrl:state.BackBanners[index].image??'',fit: BoxFit.fill)),
            )),
            onPageChanged: (value) {

            },
            autoPlayInterval: 3000,
            isLoop: true,
          );
        } );}
}