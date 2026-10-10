import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/vip/data/models/VipTapsModel.dart';
import 'package:ahlachat/vip/presentation/components/VipDialogWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VipTapWidget extends StatelessWidget {
  VipTapModel tap;
  VipTapWidget({required this.tap});
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      showImageSliderDialog( context: context,Index: tap.Index);
    },
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: tap.Status?vipAssetsContent[tap.Index].icon:vipAssetsContent[tap.Index].Bicon,height: 60,width: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(vipAssetsContent[tap.Index].MainTitle,style:StyleTitleBN.copyWith(fontSize: 9),textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
