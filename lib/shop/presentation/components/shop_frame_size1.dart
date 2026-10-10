import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShopFrameWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
        BlocBuilder<UserloginBloc, UserloginState>(
          buildWhen:(previous, current) => previous.UserProfile?.image!=previous.UserProfile?.image ,
          builder: (context, state) {
            return Align(alignment: Alignment.center,
                child: CircleAvatar(backgroundColor: Colors.transparent,
                    radius: 40,
                    backgroundImage: CachedNetworkImageProvider(
                        state.UserProfile?.image ?? '')));
          },
        ),

        BlocBuilder<ShopBloc, ShopState>(
       //   buildWhen:(previous, current) => previous.SelectedItem!=previous.SelectedItem ,
          builder: (context, state) {
            if(state.SelectedItem==null||state.SelectedItem?.kind==0){
              return InkWell(onTap: () {

              },child: Container(width: 100,height: 100,color: Colors.transparent,));
            }
            return Container( width: 100,height: 100,child: SVGASimpleImage(resUrl:state.SelectedItem?.svga));
          },
        ),

      ],),
    );
  }
}
