import 'dart:async';

import 'package:ahlachat/chairs/data/model/emojeModel.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EmojeViewmodel extends ChangeNotifier {
  List<Emojemodel> EmojeList=[];
  adduserimoge({required  id,required  emoje}){
    final newModel = Emojemodel(id:id,emoje:AppConstance.imageEmojeUrl(emoje) ,time:  DateTime.now());
    EmojeList.add(newModel);
    print(id);
    if(EmojeList.length>0){
      Timer.periodic(Duration(seconds:1,), (timer) {
        for (var i in EmojeList){
          if(DateTime.now().difference(i.time!).inSeconds>3){
            if(EmojeList.length>0){
              EmojeList.remove(i) ;
              Showtoast(message: 'removed removed');
              notifyListeners();
              break;
            }


          }
        }


      });
    }

    notifyListeners();
  }

}