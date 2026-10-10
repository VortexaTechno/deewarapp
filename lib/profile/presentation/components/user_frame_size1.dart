import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserFrameWidget1 extends StatelessWidget {

  UserModel? UserProfile;

  UserFrameWidget1({required this.UserProfile});
  @override
  Widget build(BuildContext context) {

    return  Container(
      child: Stack(alignment: Alignment.center,children: [
        UserProfile?.image==null?const SizedBox(): Align(alignment: Alignment.center,child: CircleAvatar(backgroundColor: Colors.transparent,radius:40  , backgroundImage:CachedNetworkImageProvider( UserProfile?.image??'')) ),
        UserProfile?.Frame==null?const SizedBox(): Container(height: 100,width: 100,child: SVGASimpleImage(resUrl:UserProfile?.Frame?.frame?.svga??UserProfile?.Frame?.items?.svga)),
      ],
      ),
    );
  }
}

class UserFrameWidget2 extends StatelessWidget {

  UserModel? UserProfile;

  UserFrameWidget2({required this.UserProfile});
  @override
  Widget build(BuildContext context) {

    return  Container(
      child: Stack(alignment: Alignment.center,children: [
        UserProfile?.image==null?const SizedBox(): Align(alignment: Alignment.center,child: CircleAvatar(backgroundColor: Colors.transparent,radius:30  , backgroundImage:CachedNetworkImageProvider( UserProfile?.image??'')) ),
        UserProfile?.Frame==null?const SizedBox(): Container(height: 80,width: 80,child: SVGASimpleImage(resUrl:UserProfile?.Frame?.frame?.svga??UserProfile?.Frame?.items?.svga)),
      ],
      ),
    );
  }
}

