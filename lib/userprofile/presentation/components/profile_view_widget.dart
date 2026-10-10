
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';


class ProfileView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserProfileBloc, UserProfileState>(
      buildWhen: (previous, current) =>previous.Profile?.ProfileImage!= current.Profile?.ProfileImage!,
  builder: (context, state) {
    return ImageSlideshow(
      width: double.infinity,
      height: 280,
      initialPage: 0,
      indicatorColor: Colors.transparent,
      indicatorBackgroundColor:Colors.transparent,
      children:List.generate(state.Profile?.ProfileImage?.length==0?1:state.Profile?.ProfileImage?.length??0, (index) =>
          Container(
            child: CachedNetworkImage(
                imageUrl:state.Profile?.ProfileImage?.length==0?state.Profile?.image??'':state.Profile?.ProfileImage![index].image??'',fit: BoxFit.cover),)),
      onPageChanged: (value) {},
      autoPlayInterval: 4000,
      isLoop: true,
    );
  },
);
  }
}