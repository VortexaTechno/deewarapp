import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/svga/data/ViewModel/show_entry_view_model.dart';
import 'package:ahlachat/svga/data/ViewModel/show_gift_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
class GiftShowWidget extends StatelessWidget {
  const GiftShowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowGiftViewmodel svga=  Provider.of<ShowGiftViewmodel>(context,listen: true);

    return  Center(
      child:svga.isLoading2
          ? SizedBox():SVGAImage(svga.animationController2??SVGAAnimationController(vsync: thiscontext),clearsAfterStop:false),
    );
  }
}
