import 'package:ahlachat/profile/data/models/levelModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';
class WealthIconWidget extends StatelessWidget {
 int donate;
 double hight;
 WealthIconWidget({required this.donate, this.hight=20});

  @override
  Widget build(BuildContext context) {
    CheckLevelModel mylevel= WealthLevel.where((element) => element.Amount!<=donate).last;
    return CachedNetworkImage(imageUrl: mylevel.image??'',height: hight ,);
  }
}


class IncomeIconWidget extends StatelessWidget {
  int Income;

  double hight;
  IncomeIconWidget({required this.Income, this.hight=20});
  @override
  Widget build(BuildContext context) {
    CheckLevelModel mylevel= IncomeLevel.where((element) => element.Amount!<=Income).last;
    return CachedNetworkImage(imageUrl: mylevel.image??'',height: hight,);
  }
}


