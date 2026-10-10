
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';

import 'package:flutter/material.dart';

import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';



class ShowEntryViewmodel extends ChangeNotifier {
  List<UserModel> Entries=[];
  bool isLoading2 = false;
  SVGAAnimationController ?ShowEntrySvgaController;


  ShowRoomEntryEvent({  UserModel? user })async{
    isLoading2=true;


      if(user!=null&&!Entries.contains(user)){

  Entries.add(user);

        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${Entries.length}');
        notifyListeners();
  if(Entries.isNotEmpty){
    if(ShowEntrySvgaController == null ||ShowEntrySvgaController?.value==0.0){

      ShowEntrySvgaController=await SVGAAnimationController(vsync: thiscontext)..addListener(() {
        if (ShowEntrySvgaController?.isCompleted == true){


          ShowEntrySvgaController=null;
          ShowEntrySvgaController?.dispose();


          notifyListeners();
          print(Entries);

          Entries.removeAt(0);
          print(Entries);
          print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${Entries.length}');

          if(Entries.isNotEmpty){

            print('cccccccccccccccccccccccccccccccccccccccccccccc${Entries.length}');

            ShowRoomEntryEvent(user:Entries.first );

          }

          notifyListeners();
        }});


      LoadEntry(item:Entries[0]);




    }}
      }



  }
  void LoadEntry({UserModel? item }) async {

    final videoItem = await loadVideoItem(item?.Entry?.entry?.svga??'');
    if(item?.Entry?.entry?.sound!=null){

      PlaylinkMusic(path: item?.Entry?.entry?.sound);
    }
    ShowEntrySvgaController?.clear();
    ShowEntrySvgaController?.videoItem = videoItem;

    await ShowEntrySvgaController?.forward();

    notifyListeners();
  }

}