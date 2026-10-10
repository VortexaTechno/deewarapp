import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/shop/presentation/components/Purchases_widget.dart';
import 'package:ahlachat/shop/presentation/components/shop_frame_size1.dart';
import 'package:flutter/material.dart';

class ShopHeadWidget extends StatelessWidget {
  const ShopHeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(Images.ShopBackground),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShopFrameWidget(),
          SizedBox(height: 15),
          PurchasesWidget()
        ],
      ),
    );
  }
}