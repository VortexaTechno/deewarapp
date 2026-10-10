
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/gift/data/models/GiftModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';



class ShowGiftViewmodel extends ChangeNotifier {

  SVGAAnimationController? animationController2;
  bool isLoading2 = false;
  List<dynamic> Image=[];
  ShowGiftSvga({context,GiftModel?  Give})async{

    if(Give!=null){
      Image.add({'SVGA':Give.svga,'GIVE':Give});
    }
    if(Image.isNotEmpty){
      if(animationController2 == null ||animationController2?.value==0.0){

        animationController2=await SVGAAnimationController(vsync: thiscontext, )..addListener(() {
          if (animationController2?.isCompleted == true){


            animationController2=null;
            animationController2?.dispose();
            Image.removeAt(0);
            if(Image.isNotEmpty){
              ShowGiftSvga(context: context,Give:Image.first['GIVE']  );
            }
            isLoading2 = true;
            notifyListeners();
          }});

        loadAnimation2(image:Image[0]['SVGA'],context:context,Give: Image[0]['GIVE'] );

        notifyListeners();

      }}

  }

  Future  loadVideoItem2(String image) {
    Future Function(String) decoder;
    if (image.startsWith(RegExp(r'https?://'))) {
      decoder = SVGAParser.shared.decodeFromURL;
    } else {
      decoder = SVGAParser.shared.decodeFromAssets;
    }
    return decoder(image);
  }
  void loadAnimation2({image,context,Give}) async {
    print('9');
    print(image);
    // FIXME: may throw error on loading
    final videoItem = await loadVideoItem2(image,);
    if(Give?.sound!=null){

      PlaylinkMusic(path: Give?.sound);
    }
    animationController2?.clear();
    print('loadAnimation  1010101010101010101');

    animationController2?.videoItem = videoItem;
    playAnimation2(context:context );
    notifyListeners();

  }
  void  playAnimation2({context })async {


    isLoading2=false;
    await animationController2?.forward();

    notifyListeners();
  }


}