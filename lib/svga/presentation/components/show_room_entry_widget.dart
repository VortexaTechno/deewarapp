
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

import '../../data/ViewModel/show_entry_view_model.dart';



class ShowEntryRoom extends StatefulWidget {
  const ShowEntryRoom({Key? key}) : super(key: key);

  @override
  State<ShowEntryRoom> createState() => _ShowEntryRoomState();
}

class _ShowEntryRoomState extends State<ShowEntryRoom> with TickerProviderStateMixin {
  @override
  void initState() {
    thiscontext=this;// TODO: implement initState
    super.initState();
  }
  @override


  Widget build(BuildContext context) {

  return  Consumer<ShowEntryViewmodel>(builder: (context, mainModel, child) {


      return  Center(
        child:SVGAImage(mainModel.ShowEntrySvgaController??SVGAAnimationController(vsync: thiscontext),clearsAfterStop:true),
      );

    });

  }
}
